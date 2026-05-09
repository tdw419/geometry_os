; DESCRIPTION: Places a cyan 111x63 rectangle at position (312, 147).
; PLAN: r0=312(x), r1=147(y), r2=111(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 147
LDI r2, 111
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
