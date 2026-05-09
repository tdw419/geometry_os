; DESCRIPTION: Places a orange 108x32 rectangle at position (48, 93).
; PLAN: r0=48(x), r1=93(y), r2=108(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 93
LDI r2, 108
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
