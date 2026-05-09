; DESCRIPTION: Places a orange 98x42 rectangle at position (71, 116).
; PLAN: r0=71(x), r1=116(y), r2=98(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 116
LDI r2, 98
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
