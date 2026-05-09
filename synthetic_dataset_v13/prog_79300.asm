; DESCRIPTION: Places a white line segment connecting (509, 114) to (146, 156).
; PLAN: r0=509(x1), r1=114(y1), r2=146(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 114
LDI r2, 146
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
