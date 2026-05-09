; DESCRIPTION: Renders a orange box of size 32x78 starting at (169, 152).
; PLAN: r0=169(x), r1=152(y), r2=32(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 152
LDI r2, 32
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
