; DESCRIPTION: Renders a green line between points (173, 94) and (508, 19).
; PLAN: r0=173(x1), r1=94(y1), r2=508(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 94
LDI r2, 508
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
