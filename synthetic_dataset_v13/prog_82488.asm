; DESCRIPTION: Places a green 63x63 rectangle at position (276, 22).
; PLAN: r0=276(x), r1=22(y), r2=63(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 22
LDI r2, 63
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
