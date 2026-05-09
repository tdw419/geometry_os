; DESCRIPTION: Places a black line segment connecting (223, 228) to (54, 75).
; PLAN: r0=223(x1), r1=228(y1), r2=54(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 228
LDI r2, 54
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
