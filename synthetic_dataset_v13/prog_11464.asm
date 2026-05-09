; DESCRIPTION: Draws a magenta line from (198, 152) to (360, 56).
; PLAN: r0=198(x1), r1=152(y1), r2=360(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 152
LDI r2, 360
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
