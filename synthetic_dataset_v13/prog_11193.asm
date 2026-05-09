; DESCRIPTION: Places a orange 32x103 rectangle at position (173, 36).
; PLAN: r0=173(x), r1=36(y), r2=32(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 36
LDI r2, 32
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
