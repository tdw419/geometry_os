; DESCRIPTION: Draws a black line from (382, 94) to (326, 248).
; PLAN: r0=382(x1), r1=94(y1), r2=326(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 94
LDI r2, 326
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
