; DESCRIPTION: Places a black line segment connecting (265, 173) to (60, 44).
; PLAN: r0=265(x1), r1=173(y1), r2=60(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 173
LDI r2, 60
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
