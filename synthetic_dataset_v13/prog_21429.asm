; DESCRIPTION: Draws a white line from (52, 37) to (16, 6).
; PLAN: r0=52(x1), r1=37(y1), r2=16(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 37
LDI r2, 16
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
