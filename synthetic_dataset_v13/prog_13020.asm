; DESCRIPTION: Places a orange 28x72 rectangle at position (2, 91).
; PLAN: r0=2(x), r1=91(y), r2=28(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 91
LDI r2, 28
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
