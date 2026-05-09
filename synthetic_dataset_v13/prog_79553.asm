; DESCRIPTION: Draws a cyan line from (292, 164) to (257, 101).
; PLAN: r0=292(x1), r1=164(y1), r2=257(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 164
LDI r2, 257
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
