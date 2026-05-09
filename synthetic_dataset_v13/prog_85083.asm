; DESCRIPTION: Places a red line segment connecting (222, 171) to (160, 143).
; PLAN: r0=222(x1), r1=171(y1), r2=160(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 171
LDI r2, 160
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
