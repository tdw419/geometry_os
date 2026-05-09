; DESCRIPTION: Places a cyan line segment connecting (114, 244) to (105, 103).
; PLAN: r0=114(x1), r1=244(y1), r2=105(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 244
LDI r2, 105
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
