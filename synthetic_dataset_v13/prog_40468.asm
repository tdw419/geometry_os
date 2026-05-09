; DESCRIPTION: Places a green line segment connecting (174, 27) to (244, 68).
; PLAN: r0=174(x1), r1=27(y1), r2=244(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 27
LDI r2, 244
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
