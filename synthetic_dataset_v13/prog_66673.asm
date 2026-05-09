; DESCRIPTION: Draws a white line from (281, 52) to (64, 176).
; PLAN: r0=281(x1), r1=52(y1), r2=64(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 52
LDI r2, 64
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
