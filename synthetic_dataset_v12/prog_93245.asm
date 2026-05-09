; DESCRIPTION: Draws a white line from (52, 83) to (434, 150).
; PLAN: r0=52(x1), r1=83(y1), r2=434(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 83
LDI r2, 434
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
