; DESCRIPTION: Renders a cyan line between points (449, 123) and (469, 159).
; PLAN: r0=449(x1), r1=123(y1), r2=469(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 123
LDI r2, 469
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
