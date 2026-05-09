; DESCRIPTION: Places a orange 69x27 rectangle at position (434, 42).
; PLAN: r0=434(x), r1=42(y), r2=69(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 42
LDI r2, 69
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
