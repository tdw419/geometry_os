; DESCRIPTION: Draws a cyan line from (15, 184) to (381, 63).
; PLAN: r0=15(x1), r1=184(y1), r2=381(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 184
LDI r2, 381
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
