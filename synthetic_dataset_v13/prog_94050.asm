; DESCRIPTION: Places a orange 27x28 rectangle at position (376, 227).
; PLAN: r0=376(x), r1=227(y), r2=27(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 227
LDI r2, 27
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
