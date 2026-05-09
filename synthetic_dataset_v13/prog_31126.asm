; DESCRIPTION: Places a red line segment connecting (104, 187) to (465, 29).
; PLAN: r0=104(x1), r1=187(y1), r2=465(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 187
LDI r2, 465
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
