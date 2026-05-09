; DESCRIPTION: Places a red line segment connecting (255, 159) to (60, 48).
; PLAN: r0=255(x1), r1=159(y1), r2=60(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 159
LDI r2, 60
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
