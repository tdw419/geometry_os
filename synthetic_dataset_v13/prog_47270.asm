; DESCRIPTION: Places a orange 55x76 rectangle at position (261, 44).
; PLAN: r0=261(x), r1=44(y), r2=55(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 44
LDI r2, 55
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
