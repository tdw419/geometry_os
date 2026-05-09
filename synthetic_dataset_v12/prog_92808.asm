; DESCRIPTION: Places a orange 72x47 rectangle at position (28, 156).
; PLAN: r0=28(x), r1=156(y), r2=72(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 156
LDI r2, 72
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
