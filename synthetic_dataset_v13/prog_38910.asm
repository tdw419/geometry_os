; DESCRIPTION: Composite: Places a orange 113x35 rectangle at position (388, 205) then Places a blue line segment connecting (234, 164) to (111, 16) then Renders a red disk with center (190, 64) and radius 33.
; PLAN: r0=388(x), r1=205(y), r2=113(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x1), r6=164(y1), r7=111(x2), r8=16(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=64(y), r12=33(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 205
LDI r2, 113
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 164
LDI r7, 111
LDI r8, 16
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 64
LDI r12, 33
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
