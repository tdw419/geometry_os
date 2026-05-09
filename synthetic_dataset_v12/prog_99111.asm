; DESCRIPTION: Draws a yellow line from (242, 96) to (435, 130).
; PLAN: r0=242(x1), r1=96(y1), r2=435(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 96
LDI r2, 435
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
