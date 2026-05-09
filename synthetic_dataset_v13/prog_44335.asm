; DESCRIPTION: Places a orange 98x11 rectangle at position (95, 63).
; PLAN: r0=95(x), r1=63(y), r2=98(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 63
LDI r2, 98
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
