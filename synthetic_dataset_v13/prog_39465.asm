; DESCRIPTION: Places a cyan line segment connecting (117, 174) to (130, 163).
; PLAN: r0=117(x1), r1=174(y1), r2=130(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 174
LDI r2, 130
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
