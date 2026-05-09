; DESCRIPTION: Places a orange 107x23 rectangle at position (188, 27).
; PLAN: r0=188(x), r1=27(y), r2=107(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 27
LDI r2, 107
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
