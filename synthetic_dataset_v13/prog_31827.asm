; DESCRIPTION: Places a yellow line segment connecting (214, 0) to (320, 166).
; PLAN: r0=214(x1), r1=0(y1), r2=320(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 0
LDI r2, 320
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
