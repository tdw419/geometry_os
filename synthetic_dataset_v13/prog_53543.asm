; DESCRIPTION: Draws a yellow line from (25, 152) to (223, 192).
; PLAN: r0=25(x1), r1=152(y1), r2=223(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 152
LDI r2, 223
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
