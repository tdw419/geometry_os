; DESCRIPTION: Places a white line segment connecting (82, 198) to (197, 91).
; PLAN: r0=82(x1), r1=198(y1), r2=197(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 198
LDI r2, 197
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
