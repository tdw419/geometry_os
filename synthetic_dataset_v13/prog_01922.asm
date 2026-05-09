; DESCRIPTION: Places a orange 70x71 rectangle at position (156, 58).
; PLAN: r0=156(x), r1=58(y), r2=70(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 58
LDI r2, 70
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
