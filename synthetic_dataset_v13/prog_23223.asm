; DESCRIPTION: Draws a white line from (52, 20) to (120, 86).
; PLAN: r0=52(x1), r1=20(y1), r2=120(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 20
LDI r2, 120
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
