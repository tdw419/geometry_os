; DESCRIPTION: Places a orange 46x115 rectangle at position (357, 42).
; PLAN: r0=357(x), r1=42(y), r2=46(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 42
LDI r2, 46
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
