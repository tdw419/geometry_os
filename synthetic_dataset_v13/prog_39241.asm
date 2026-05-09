; DESCRIPTION: Places a orange 75x72 rectangle at position (124, 121).
; PLAN: r0=124(x), r1=121(y), r2=75(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 121
LDI r2, 75
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
