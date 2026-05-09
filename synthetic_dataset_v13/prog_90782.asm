; DESCRIPTION: Draws a orange line from (356, 114) to (487, 209).
; PLAN: r0=356(x1), r1=114(y1), r2=487(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 114
LDI r2, 487
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
