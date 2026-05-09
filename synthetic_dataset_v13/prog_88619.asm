; DESCRIPTION: Places a orange 30x68 rectangle at position (406, 72).
; PLAN: r0=406(x), r1=72(y), r2=30(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 72
LDI r2, 30
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
