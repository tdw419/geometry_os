; DESCRIPTION: Composite: Renders a cyan line between points (61, 59) and (174, 187) then Places a blue circle of radius 27 at center (121, 209) then Draws a red rectangle at (53, 95) with width 42 and height 82.
; PLAN: r0=61(x1), r1=59(y1), r2=174(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=209(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x), r11=95(y), r12=42(width), r13=82(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 59
LDI r2, 174
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 209
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 95
LDI r12, 42
LDI r13, 82
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
