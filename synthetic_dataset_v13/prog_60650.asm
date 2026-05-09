; DESCRIPTION: Places a orange 42x67 rectangle at position (174, 18).
; PLAN: r0=174(x), r1=18(y), r2=42(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 18
LDI r2, 42
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
