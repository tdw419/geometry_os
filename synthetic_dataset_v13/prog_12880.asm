; DESCRIPTION: Draws a white line from (257, 135) to (510, 59).
; PLAN: r0=257(x1), r1=135(y1), r2=510(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 135
LDI r2, 510
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
