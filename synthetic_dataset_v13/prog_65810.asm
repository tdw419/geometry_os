; DESCRIPTION: Draws a white line from (350, 95) to (294, 136).
; PLAN: r0=350(x1), r1=95(y1), r2=294(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 95
LDI r2, 294
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
