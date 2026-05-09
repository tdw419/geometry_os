; DESCRIPTION: Places a white line segment connecting (82, 209) to (210, 36).
; PLAN: r0=82(x1), r1=209(y1), r2=210(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 209
LDI r2, 210
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
