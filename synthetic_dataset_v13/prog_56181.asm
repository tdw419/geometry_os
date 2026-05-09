; DESCRIPTION: Composite: Renders a magenta line between points (403, 154) and (475, 19) then Renders a cyan disk with center (99, 78) and radius 72 then Sets a single green pixel at (235, 6).
; PLAN: r0=403(x1), r1=154(y1), r2=475(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=78(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=6(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 154
LDI r2, 475
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 78
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 6
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
