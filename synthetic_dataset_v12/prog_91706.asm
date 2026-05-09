; DESCRIPTION: Places a orange line segment connecting (208, 239) to (150, 209).
; PLAN: r0=208(x1), r1=239(y1), r2=150(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 239
LDI r2, 150
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
