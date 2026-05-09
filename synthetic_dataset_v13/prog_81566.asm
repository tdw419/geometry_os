; DESCRIPTION: Places a white line segment connecting (405, 235) to (167, 57).
; PLAN: r0=405(x1), r1=235(y1), r2=167(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 235
LDI r2, 167
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
