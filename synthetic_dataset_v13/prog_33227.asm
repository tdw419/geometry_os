; DESCRIPTION: Draws a black line from (275, 220) to (210, 26).
; PLAN: r0=275(x1), r1=220(y1), r2=210(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 220
LDI r2, 210
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
