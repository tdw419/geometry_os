; DESCRIPTION: Draws a white line from (413, 135) to (257, 207).
; PLAN: r0=413(x1), r1=135(y1), r2=257(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 135
LDI r2, 257
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
