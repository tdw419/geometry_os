; DESCRIPTION: Draws a cyan line from (257, 116) to (452, 225).
; PLAN: r0=257(x1), r1=116(y1), r2=452(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 116
LDI r2, 452
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
