; DESCRIPTION: Draws a green line from (406, 109) to (433, 39).
; PLAN: r0=406(x1), r1=109(y1), r2=433(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 109
LDI r2, 433
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
