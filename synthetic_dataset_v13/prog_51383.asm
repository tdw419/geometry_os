; DESCRIPTION: Places a cyan line segment connecting (130, 141) to (213, 212).
; PLAN: r0=130(x1), r1=141(y1), r2=213(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 141
LDI r2, 213
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
