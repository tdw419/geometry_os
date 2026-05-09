; DESCRIPTION: Places a orange 27x91 rectangle at position (49, 75).
; PLAN: r0=49(x), r1=75(y), r2=27(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 75
LDI r2, 27
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
