; DESCRIPTION: Places a orange 32x84 rectangle at position (177, 30).
; PLAN: r0=177(x), r1=30(y), r2=32(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 30
LDI r2, 32
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
