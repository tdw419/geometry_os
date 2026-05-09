; DESCRIPTION: Places a white line segment connecting (356, 96) to (342, 146).
; PLAN: r0=356(x1), r1=96(y1), r2=342(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 96
LDI r2, 342
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
