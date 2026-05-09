; DESCRIPTION: Places a red line segment connecting (128, 129) to (217, 181).
; PLAN: r0=128(x1), r1=129(y1), r2=217(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 129
LDI r2, 217
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
