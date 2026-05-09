; DESCRIPTION: Places a orange 11x15 rectangle at position (169, 231).
; PLAN: r0=169(x), r1=231(y), r2=11(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 231
LDI r2, 11
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
