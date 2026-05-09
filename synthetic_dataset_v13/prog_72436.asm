; DESCRIPTION: Draws a yellow line from (112, 31) to (91, 210).
; PLAN: r0=112(x1), r1=31(y1), r2=91(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 31
LDI r2, 91
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
