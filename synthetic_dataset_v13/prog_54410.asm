; DESCRIPTION: Places a orange 64x75 rectangle at position (57, 8).
; PLAN: r0=57(x), r1=8(y), r2=64(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 8
LDI r2, 64
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
