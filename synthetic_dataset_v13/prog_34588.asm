; DESCRIPTION: Places a red line segment connecting (372, 116) to (410, 81).
; PLAN: r0=372(x1), r1=116(y1), r2=410(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 116
LDI r2, 410
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
