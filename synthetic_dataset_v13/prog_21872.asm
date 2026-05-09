; DESCRIPTION: Places a white line segment connecting (215, 21) to (290, 244).
; PLAN: r0=215(x1), r1=21(y1), r2=290(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 21
LDI r2, 290
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
