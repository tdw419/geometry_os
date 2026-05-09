; DESCRIPTION: Places a red line segment connecting (360, 236) to (283, 210).
; PLAN: r0=360(x1), r1=236(y1), r2=283(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 236
LDI r2, 283
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
