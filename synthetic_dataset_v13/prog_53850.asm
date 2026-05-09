; DESCRIPTION: Places a orange 68x116 rectangle at position (42, 69).
; PLAN: r0=42(x), r1=69(y), r2=68(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 69
LDI r2, 68
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
