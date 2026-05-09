; DESCRIPTION: Composite: Renders a yellow disk with center (110, 180) and radius 62 then Renders a yellow box of size 34x59 starting at (430, 77) then Sets a single magenta pixel at (213, 31).
; PLAN: r0=110(x), r1=180(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=77(y), r7=34(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=31(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 180
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 77
LDI r7, 34
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 31
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
