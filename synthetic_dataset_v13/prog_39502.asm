; DESCRIPTION: Places a green line segment connecting (82, 114) to (492, 234).
; PLAN: r0=82(x1), r1=114(y1), r2=492(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 114
LDI r2, 492
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
