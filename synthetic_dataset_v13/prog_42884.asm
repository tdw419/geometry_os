; DESCRIPTION: Renders a yellow line between points (72, 48) and (465, 104).
; PLAN: r0=72(x1), r1=48(y1), r2=465(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 48
LDI r2, 465
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
