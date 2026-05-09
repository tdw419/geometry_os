; DESCRIPTION: Draws a yellow line from (329, 205) to (340, 179).
; PLAN: r0=329(x1), r1=205(y1), r2=340(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 205
LDI r2, 340
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
