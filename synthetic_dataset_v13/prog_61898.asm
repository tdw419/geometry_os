; DESCRIPTION: Places a orange 92x81 rectangle at position (26, 166).
; PLAN: r0=26(x), r1=166(y), r2=92(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 166
LDI r2, 92
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
