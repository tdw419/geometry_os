; DESCRIPTION: Draws a white line from (63, 13) to (269, 37).
; PLAN: r0=63(x1), r1=13(y1), r2=269(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 269
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
