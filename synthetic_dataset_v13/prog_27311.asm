; DESCRIPTION: Renders a cyan line between points (504, 254) and (325, 238).
; PLAN: r0=504(x1), r1=254(y1), r2=325(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 254
LDI r2, 325
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
