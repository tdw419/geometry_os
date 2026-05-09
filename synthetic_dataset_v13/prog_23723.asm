; DESCRIPTION: Renders a cyan line between points (389, 162) and (275, 131).
; PLAN: r0=389(x1), r1=162(y1), r2=275(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 162
LDI r2, 275
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
