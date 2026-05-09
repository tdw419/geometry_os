; DESCRIPTION: Draws a white line from (326, 159) to (27, 9).
; PLAN: r0=326(x1), r1=159(y1), r2=27(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 159
LDI r2, 27
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
