; DESCRIPTION: Places a orange 63x85 rectangle at position (372, 109).
; PLAN: r0=372(x), r1=109(y), r2=63(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 109
LDI r2, 63
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
