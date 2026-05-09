; DESCRIPTION: Draws a orange line from (370, 186) to (152, 142).
; PLAN: r0=370(x1), r1=186(y1), r2=152(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 186
LDI r2, 152
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
