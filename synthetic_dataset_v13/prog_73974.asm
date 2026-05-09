; DESCRIPTION: Draws a black line from (126, 102) to (446, 159).
; PLAN: r0=126(x1), r1=102(y1), r2=446(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 102
LDI r2, 446
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
