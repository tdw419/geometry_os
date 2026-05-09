; DESCRIPTION: Places a red line segment connecting (239, 210) to (462, 194).
; PLAN: r0=239(x1), r1=210(y1), r2=462(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 210
LDI r2, 462
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
