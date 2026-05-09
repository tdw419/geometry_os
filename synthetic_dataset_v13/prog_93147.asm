; DESCRIPTION: Draws a black line from (313, 29) to (409, 242).
; PLAN: r0=313(x1), r1=29(y1), r2=409(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 29
LDI r2, 409
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
