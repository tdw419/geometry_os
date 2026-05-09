; DESCRIPTION: Composite: Renders a cyan line between points (4, 68) and (359, 224) then Places a magenta circle of radius 17 at center (22, 137).
; PLAN: r0=4(x1), r1=68(y1), r2=359(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=137(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 68
LDI r2, 359
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 137
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
