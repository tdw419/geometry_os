; DESCRIPTION: Draws a green line from (142, 47) to (91, 103).
; PLAN: r0=142(x1), r1=47(y1), r2=91(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 47
LDI r2, 91
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
