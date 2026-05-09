; DESCRIPTION: Places a black line segment connecting (419, 166) to (228, 215).
; PLAN: r0=419(x1), r1=166(y1), r2=228(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 166
LDI r2, 228
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
