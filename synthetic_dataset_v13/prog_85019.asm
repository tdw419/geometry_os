; DESCRIPTION: Composite: Draws a cyan line from (439, 192) to (485, 77) then Renders a yellow disk with center (291, 94) and radius 20.
; PLAN: r0=439(x1), r1=192(y1), r2=485(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=94(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 192
LDI r2, 485
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 94
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
