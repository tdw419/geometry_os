; DESCRIPTION: Draws a white line from (126, 161) to (255, 211).
; PLAN: r0=126(x1), r1=161(y1), r2=255(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 161
LDI r2, 255
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
