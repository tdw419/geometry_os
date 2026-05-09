; DESCRIPTION: Renders a white line between points (208, 160) and (510, 238).
; PLAN: r0=208(x1), r1=160(y1), r2=510(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 160
LDI r2, 510
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
