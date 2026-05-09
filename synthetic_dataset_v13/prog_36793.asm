; DESCRIPTION: Places a green line segment connecting (284, 245) to (11, 76).
; PLAN: r0=284(x1), r1=245(y1), r2=11(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 245
LDI r2, 11
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
