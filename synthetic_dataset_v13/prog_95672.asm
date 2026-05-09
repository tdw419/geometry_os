; DESCRIPTION: Draws a red line from (326, 23) to (272, 64).
; PLAN: r0=326(x1), r1=23(y1), r2=272(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 23
LDI r2, 272
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
