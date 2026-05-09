; DESCRIPTION: Places a white line segment connecting (410, 240) to (100, 177).
; PLAN: r0=410(x1), r1=240(y1), r2=100(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 240
LDI r2, 100
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
