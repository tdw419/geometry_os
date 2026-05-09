; DESCRIPTION: Places a orange 69x74 rectangle at position (188, 141).
; PLAN: r0=188(x), r1=141(y), r2=69(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 141
LDI r2, 69
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
