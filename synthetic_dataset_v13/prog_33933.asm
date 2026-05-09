; DESCRIPTION: Draws a cyan line from (390, 142) to (260, 52).
; PLAN: r0=390(x1), r1=142(y1), r2=260(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 142
LDI r2, 260
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
