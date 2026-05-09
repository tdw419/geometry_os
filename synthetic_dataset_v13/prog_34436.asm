; DESCRIPTION: Draws a white line from (52, 243) to (413, 120).
; PLAN: r0=52(x1), r1=243(y1), r2=413(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 243
LDI r2, 413
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
