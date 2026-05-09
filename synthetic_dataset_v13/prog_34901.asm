; DESCRIPTION: Places a orange 82x66 rectangle at position (191, 6).
; PLAN: r0=191(x), r1=6(y), r2=82(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 6
LDI r2, 82
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
