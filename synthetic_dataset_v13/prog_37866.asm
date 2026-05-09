; DESCRIPTION: Draws a cyan line from (176, 128) to (376, 67).
; PLAN: r0=176(x1), r1=128(y1), r2=376(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 128
LDI r2, 376
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
