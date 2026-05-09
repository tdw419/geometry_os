; DESCRIPTION: Draws a white line from (470, 224) to (5, 75).
; PLAN: r0=470(x1), r1=224(y1), r2=5(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 224
LDI r2, 5
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
