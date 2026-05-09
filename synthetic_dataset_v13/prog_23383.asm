; DESCRIPTION: Places a orange 33x115 rectangle at position (461, 19).
; PLAN: r0=461(x), r1=19(y), r2=33(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 19
LDI r2, 33
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
