; DESCRIPTION: Places a orange 28x66 rectangle at position (174, 149).
; PLAN: r0=174(x), r1=149(y), r2=28(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 149
LDI r2, 28
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
