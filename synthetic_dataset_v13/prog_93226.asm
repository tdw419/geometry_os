; DESCRIPTION: Places a orange 10x27 rectangle at position (273, 115).
; PLAN: r0=273(x), r1=115(y), r2=10(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 115
LDI r2, 10
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
