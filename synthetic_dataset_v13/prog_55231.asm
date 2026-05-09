; DESCRIPTION: Places a orange 102x64 rectangle at position (397, 144).
; PLAN: r0=397(x), r1=144(y), r2=102(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 144
LDI r2, 102
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
