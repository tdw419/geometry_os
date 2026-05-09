; DESCRIPTION: Renders a orange box of size 42x30 starting at (152, 99).
; PLAN: r0=152(x), r1=99(y), r2=42(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 99
LDI r2, 42
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
