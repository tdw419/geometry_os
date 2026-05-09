; DESCRIPTION: Draws a green line from (49, 44) to (372, 195).
; PLAN: r0=49(x1), r1=44(y1), r2=372(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 44
LDI r2, 372
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
