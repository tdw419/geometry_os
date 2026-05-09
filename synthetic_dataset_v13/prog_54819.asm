; DESCRIPTION: Renders a cyan line between points (291, 23) and (419, 229).
; PLAN: r0=291(x1), r1=23(y1), r2=419(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 23
LDI r2, 419
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
