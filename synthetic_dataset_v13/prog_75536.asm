; DESCRIPTION: Draws a red line from (198, 32) to (152, 252).
; PLAN: r0=198(x1), r1=32(y1), r2=152(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 32
LDI r2, 152
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
