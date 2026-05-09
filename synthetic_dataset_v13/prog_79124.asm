; DESCRIPTION: Places a orange 74x50 rectangle at position (329, 17).
; PLAN: r0=329(x), r1=17(y), r2=74(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 17
LDI r2, 74
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
