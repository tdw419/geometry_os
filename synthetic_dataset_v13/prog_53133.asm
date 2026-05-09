; DESCRIPTION: Places a orange 113x66 rectangle at position (341, 32).
; PLAN: r0=341(x), r1=32(y), r2=113(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 32
LDI r2, 113
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
