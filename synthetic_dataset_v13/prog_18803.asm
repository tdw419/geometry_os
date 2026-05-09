; DESCRIPTION: Places a orange 73x29 rectangle at position (239, 172).
; PLAN: r0=239(x), r1=172(y), r2=73(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 172
LDI r2, 73
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
