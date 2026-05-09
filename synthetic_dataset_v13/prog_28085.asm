; DESCRIPTION: Draws a cyan line from (257, 225) to (379, 231).
; PLAN: r0=257(x1), r1=225(y1), r2=379(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 225
LDI r2, 379
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
