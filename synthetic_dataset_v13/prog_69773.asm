; DESCRIPTION: Renders a cyan line between points (418, 195) and (452, 20).
; PLAN: r0=418(x1), r1=195(y1), r2=452(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 195
LDI r2, 452
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
