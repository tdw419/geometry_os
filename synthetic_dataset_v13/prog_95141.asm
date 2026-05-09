; DESCRIPTION: Draws a magenta line from (364, 45) to (298, 88).
; PLAN: r0=364(x1), r1=45(y1), r2=298(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 45
LDI r2, 298
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
