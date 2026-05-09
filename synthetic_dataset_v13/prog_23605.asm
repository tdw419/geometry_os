; DESCRIPTION: Places a red line segment connecting (346, 163) to (205, 177).
; PLAN: r0=346(x1), r1=163(y1), r2=205(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 163
LDI r2, 205
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
