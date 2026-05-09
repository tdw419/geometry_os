; DESCRIPTION: Draws a yellow line from (295, 252) to (20, 138).
; PLAN: r0=295(x1), r1=252(y1), r2=20(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 252
LDI r2, 20
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
