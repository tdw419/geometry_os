; DESCRIPTION: Renders a cyan line between points (185, 19) and (500, 31).
; PLAN: r0=185(x1), r1=19(y1), r2=500(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 19
LDI r2, 500
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
