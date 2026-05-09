; DESCRIPTION: Places a orange 24x56 rectangle at position (211, 6).
; PLAN: r0=211(x), r1=6(y), r2=24(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 6
LDI r2, 24
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
