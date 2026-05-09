; DESCRIPTION: Places a magenta 68x48 rectangle at position (444, 176).
; PLAN: r0=444(x), r1=176(y), r2=68(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 176
LDI r2, 68
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
