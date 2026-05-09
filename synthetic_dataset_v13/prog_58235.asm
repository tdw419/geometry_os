; DESCRIPTION: Places a orange 103x73 rectangle at position (78, 124).
; PLAN: r0=78(x), r1=124(y), r2=103(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 124
LDI r2, 103
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
