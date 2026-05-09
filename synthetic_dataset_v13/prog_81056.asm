; DESCRIPTION: Draws a white line from (64, 87) to (296, 52).
; PLAN: r0=64(x1), r1=87(y1), r2=296(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 87
LDI r2, 296
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
