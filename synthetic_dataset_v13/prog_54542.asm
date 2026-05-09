; DESCRIPTION: Places a white line segment connecting (167, 208) to (263, 43).
; PLAN: r0=167(x1), r1=208(y1), r2=263(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 208
LDI r2, 263
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
