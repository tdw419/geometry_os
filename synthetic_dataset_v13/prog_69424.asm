; DESCRIPTION: Places a orange 111x105 rectangle at position (68, 88).
; PLAN: r0=68(x), r1=88(y), r2=111(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 88
LDI r2, 111
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
