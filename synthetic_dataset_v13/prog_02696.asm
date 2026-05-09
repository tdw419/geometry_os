; DESCRIPTION: Draws a cyan line from (257, 227) to (236, 174).
; PLAN: r0=257(x1), r1=227(y1), r2=236(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 227
LDI r2, 236
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
