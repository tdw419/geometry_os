; DESCRIPTION: Places a white line segment connecting (230, 209) to (401, 61).
; PLAN: r0=230(x1), r1=209(y1), r2=401(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 209
LDI r2, 401
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
