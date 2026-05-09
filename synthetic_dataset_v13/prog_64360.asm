; DESCRIPTION: Draws a cyan line from (257, 174) to (148, 93).
; PLAN: r0=257(x1), r1=174(y1), r2=148(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 174
LDI r2, 148
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
