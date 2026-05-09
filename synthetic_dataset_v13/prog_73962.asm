; DESCRIPTION: Places a yellow 63x34 rectangle at position (247, 176).
; PLAN: r0=247(x), r1=176(y), r2=63(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 176
LDI r2, 63
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
