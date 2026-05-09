; DESCRIPTION: Places a cyan 42x26 rectangle at position (419, 219).
; PLAN: r0=419(x), r1=219(y), r2=42(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 219
LDI r2, 42
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
