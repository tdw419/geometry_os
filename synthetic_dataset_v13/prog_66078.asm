; DESCRIPTION: Draws a magenta line from (25, 152) to (110, 166).
; PLAN: r0=25(x1), r1=152(y1), r2=110(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 152
LDI r2, 110
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
