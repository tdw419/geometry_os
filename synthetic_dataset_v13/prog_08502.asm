; DESCRIPTION: Draws a yellow line from (18, 217) to (224, 125).
; PLAN: r0=18(x1), r1=217(y1), r2=224(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 217
LDI r2, 224
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
