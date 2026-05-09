; DESCRIPTION: Places a orange 56x91 rectangle at position (82, 122).
; PLAN: r0=82(x), r1=122(y), r2=56(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 122
LDI r2, 56
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
