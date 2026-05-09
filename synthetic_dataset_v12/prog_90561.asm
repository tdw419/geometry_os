; DESCRIPTION: Places a cyan line segment connecting (461, 166) to (293, 169).
; PLAN: r0=461(x1), r1=166(y1), r2=293(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 166
LDI r2, 293
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
