; DESCRIPTION: Places a orange 107x14 rectangle at position (32, 194).
; PLAN: r0=32(x), r1=194(y), r2=107(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 194
LDI r2, 107
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
