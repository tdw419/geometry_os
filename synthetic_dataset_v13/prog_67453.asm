; DESCRIPTION: Draws a white line from (264, 70) to (434, 9).
; PLAN: r0=264(x1), r1=70(y1), r2=434(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 70
LDI r2, 434
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
