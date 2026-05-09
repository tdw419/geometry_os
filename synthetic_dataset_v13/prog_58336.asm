; DESCRIPTION: Composite: Creates a cyan circular shape at (121, 146) with radius 77 then Places a blue line segment connecting (62, 3) to (399, 3) then Renders a white box of size 90x70 starting at (73, 128).
; PLAN: r0=121(x), r1=146(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=3(y1), r7=399(x2), r8=3(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=128(y), r12=90(width), r13=70(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 146
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 3
LDI r7, 399
LDI r8, 3
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 128
LDI r12, 90
LDI r13, 70
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
