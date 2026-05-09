; DESCRIPTION: Places a orange 76x74 rectangle at position (419, 167).
; PLAN: r0=419(x), r1=167(y), r2=76(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 167
LDI r2, 76
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
