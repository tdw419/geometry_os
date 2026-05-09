; DESCRIPTION: Draws a cyan line from (256, 207) to (376, 19).
; PLAN: r0=256(x1), r1=207(y1), r2=376(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 207
LDI r2, 376
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
