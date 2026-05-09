; DESCRIPTION: Draws a red line from (275, 23) to (257, 255).
; PLAN: r0=275(x1), r1=23(y1), r2=257(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 23
LDI r2, 257
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
