; DESCRIPTION: Places a orange 30x55 rectangle at position (203, 96).
; PLAN: r0=203(x), r1=96(y), r2=30(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 96
LDI r2, 30
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
