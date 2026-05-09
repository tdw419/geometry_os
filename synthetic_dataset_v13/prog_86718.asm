; DESCRIPTION: Places a orange 16x111 rectangle at position (343, 70).
; PLAN: r0=343(x), r1=70(y), r2=16(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 70
LDI r2, 16
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
