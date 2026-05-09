; DESCRIPTION: Draws a cyan line from (442, 199) to (471, 141).
; PLAN: r0=442(x1), r1=199(y1), r2=471(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 199
LDI r2, 471
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
