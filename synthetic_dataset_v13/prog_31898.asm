; DESCRIPTION: Places a black 75x42 rectangle at position (203, 12).
; PLAN: r0=203(x), r1=12(y), r2=75(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 12
LDI r2, 75
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
