; DESCRIPTION: Places a orange 109x42 rectangle at position (358, 72).
; PLAN: r0=358(x), r1=72(y), r2=109(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 72
LDI r2, 109
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
