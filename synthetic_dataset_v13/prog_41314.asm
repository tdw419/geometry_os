; DESCRIPTION: Draws a yellow line from (141, 205) to (146, 152).
; PLAN: r0=141(x1), r1=205(y1), r2=146(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 205
LDI r2, 146
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
