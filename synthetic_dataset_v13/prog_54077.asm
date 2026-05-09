; DESCRIPTION: Places a orange 98x116 rectangle at position (229, 42).
; PLAN: r0=229(x), r1=42(y), r2=98(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 42
LDI r2, 98
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
