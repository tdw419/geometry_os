; DESCRIPTION: Composite: Draws a red circle centered at (269, 112) with radius 50 then Renders a blue line between points (510, 138) and (53, 246) then Places a cyan 107x102 rectangle at position (313, 63).
; PLAN: r0=269(x), r1=112(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x1), r6=138(y1), r7=53(x2), r8=246(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=63(y), r12=107(width), r13=102(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 112
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 138
LDI r7, 53
LDI r8, 246
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 63
LDI r12, 107
LDI r13, 102
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
