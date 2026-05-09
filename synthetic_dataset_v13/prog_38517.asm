; DESCRIPTION: Places a orange 65x30 rectangle at position (102, 101).
; PLAN: r0=102(x), r1=101(y), r2=65(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 101
LDI r2, 65
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
