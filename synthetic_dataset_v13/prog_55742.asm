; DESCRIPTION: Draws a yellow line from (303, 211) to (258, 242).
; PLAN: r0=303(x1), r1=211(y1), r2=258(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 211
LDI r2, 258
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
