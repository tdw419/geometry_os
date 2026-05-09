; DESCRIPTION: Draws a orange line from (254, 66) to (242, 234).
; PLAN: r0=254(x1), r1=66(y1), r2=242(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 66
LDI r2, 242
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
