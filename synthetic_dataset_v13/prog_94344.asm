; DESCRIPTION: Draws a cyan line from (257, 224) to (491, 186).
; PLAN: r0=257(x1), r1=224(y1), r2=491(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 224
LDI r2, 491
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
