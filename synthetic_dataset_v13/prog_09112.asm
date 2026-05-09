; DESCRIPTION: Renders a cyan line between points (289, 131) and (500, 9).
; PLAN: r0=289(x1), r1=131(y1), r2=500(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 131
LDI r2, 500
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
