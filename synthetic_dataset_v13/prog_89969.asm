; DESCRIPTION: Places a orange 14x28 rectangle at position (152, 189).
; PLAN: r0=152(x), r1=189(y), r2=14(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 189
LDI r2, 14
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
