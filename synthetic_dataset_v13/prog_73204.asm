; DESCRIPTION: Places a red line segment connecting (66, 124) to (354, 21).
; PLAN: r0=66(x1), r1=124(y1), r2=354(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 124
LDI r2, 354
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
