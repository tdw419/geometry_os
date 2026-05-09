; DESCRIPTION: Draws a white line from (180, 144) to (58, 26).
; PLAN: r0=180(x1), r1=144(y1), r2=58(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 144
LDI r2, 58
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
