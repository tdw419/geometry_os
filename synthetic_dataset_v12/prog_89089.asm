; DESCRIPTION: Places a orange 47x48 rectangle at position (414, 81).
; PLAN: r0=414(x), r1=81(y), r2=47(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 81
LDI r2, 47
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
