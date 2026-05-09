; DESCRIPTION: Places a orange 11x102 rectangle at position (74, 71).
; PLAN: r0=74(x), r1=71(y), r2=11(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 71
LDI r2, 11
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
