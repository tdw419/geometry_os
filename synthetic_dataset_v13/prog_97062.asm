; DESCRIPTION: Draws a white line from (393, 152) to (128, 78).
; PLAN: r0=393(x1), r1=152(y1), r2=128(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 152
LDI r2, 128
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
