; DESCRIPTION: Places a red line segment connecting (173, 120) to (293, 210).
; PLAN: r0=173(x1), r1=120(y1), r2=293(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 120
LDI r2, 293
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
