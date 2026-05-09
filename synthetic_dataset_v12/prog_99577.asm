; DESCRIPTION: Draws a green line from (279, 35) to (275, 46).
; PLAN: r0=279(x1), r1=35(y1), r2=275(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 35
LDI r2, 275
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
