; DESCRIPTION: Composite: Draws a magenta circle centered at (442, 138) with radius 64 then Renders a cyan box of size 58x82 starting at (313, 93) then Draws a red line from (367, 157) to (399, 187).
; PLAN: r0=442(x), r1=138(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=93(y), r7=58(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x1), r11=157(y1), r12=399(x2), r13=187(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 138
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 93
LDI r7, 58
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 157
LDI r12, 399
LDI r13, 187
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
