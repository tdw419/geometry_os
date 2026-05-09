; DESCRIPTION: Places a orange 85x57 rectangle at position (253, 120).
; PLAN: r0=253(x), r1=120(y), r2=85(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 120
LDI r2, 85
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
