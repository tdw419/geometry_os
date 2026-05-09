; DESCRIPTION: Draws a white line from (64, 110) to (27, 231).
; PLAN: r0=64(x1), r1=110(y1), r2=27(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 110
LDI r2, 27
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
