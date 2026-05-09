; DESCRIPTION: Places a green line segment connecting (465, 13) to (103, 134).
; PLAN: r0=465(x1), r1=13(y1), r2=103(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 13
LDI r2, 103
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
