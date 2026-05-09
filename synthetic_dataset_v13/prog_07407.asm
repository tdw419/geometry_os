; DESCRIPTION: Places a orange 62x48 rectangle at position (219, 47).
; PLAN: r0=219(x), r1=47(y), r2=62(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 47
LDI r2, 62
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
