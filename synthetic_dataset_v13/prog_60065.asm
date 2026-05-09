; DESCRIPTION: Places a orange line segment connecting (10, 239) to (206, 164).
; PLAN: r0=10(x1), r1=239(y1), r2=206(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 239
LDI r2, 206
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
