; DESCRIPTION: Places a yellow 95x29 rectangle at position (323, 63).
; PLAN: r0=323(x), r1=63(y), r2=95(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 63
LDI r2, 95
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
