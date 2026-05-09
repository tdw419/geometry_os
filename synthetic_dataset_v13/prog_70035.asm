; DESCRIPTION: Places a orange 82x48 rectangle at position (227, 86).
; PLAN: r0=227(x), r1=86(y), r2=82(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 86
LDI r2, 82
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
