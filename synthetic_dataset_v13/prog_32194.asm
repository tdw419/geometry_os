; DESCRIPTION: Places a orange 96x14 rectangle at position (329, 210).
; PLAN: r0=329(x), r1=210(y), r2=96(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 210
LDI r2, 96
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
