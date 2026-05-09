; DESCRIPTION: Places a cyan line segment connecting (174, 86) to (303, 25).
; PLAN: r0=174(x1), r1=86(y1), r2=303(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 86
LDI r2, 303
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
