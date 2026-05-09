; DESCRIPTION: Draws a black line from (242, 11) to (406, 33).
; PLAN: r0=242(x1), r1=11(y1), r2=406(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 11
LDI r2, 406
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
