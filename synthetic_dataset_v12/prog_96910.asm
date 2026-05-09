; DESCRIPTION: Places a orange 28x29 rectangle at position (431, 120).
; PLAN: r0=431(x), r1=120(y), r2=28(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 120
LDI r2, 28
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
