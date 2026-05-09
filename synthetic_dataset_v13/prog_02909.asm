; DESCRIPTION: Places a red line segment connecting (442, 16) to (239, 7).
; PLAN: r0=442(x1), r1=16(y1), r2=239(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 16
LDI r2, 239
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
