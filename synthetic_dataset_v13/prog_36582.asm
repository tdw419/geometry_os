; DESCRIPTION: Places a orange 85x15 rectangle at position (425, 103).
; PLAN: r0=425(x), r1=103(y), r2=85(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 103
LDI r2, 85
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
