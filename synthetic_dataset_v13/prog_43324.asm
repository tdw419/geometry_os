; DESCRIPTION: Composite: Renders a cyan line between points (261, 235) and (99, 57) then Renders a green disk with center (352, 81) and radius 70.
; PLAN: r0=261(x1), r1=235(y1), r2=99(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=81(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 235
LDI r2, 99
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 81
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
