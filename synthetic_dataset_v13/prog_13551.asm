; DESCRIPTION: Renders a cyan line between points (241, 97) and (429, 76).
; PLAN: r0=241(x1), r1=97(y1), r2=429(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 97
LDI r2, 429
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
