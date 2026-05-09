; DESCRIPTION: Draws a black line from (77, 33) to (242, 99).
; PLAN: r0=77(x1), r1=33(y1), r2=242(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 33
LDI r2, 242
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
