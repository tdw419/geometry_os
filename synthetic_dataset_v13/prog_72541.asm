; DESCRIPTION: Places a green line segment connecting (465, 134) to (333, 178).
; PLAN: r0=465(x1), r1=134(y1), r2=333(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 134
LDI r2, 333
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
