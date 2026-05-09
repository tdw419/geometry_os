; DESCRIPTION: Places a orange 48x31 rectangle at position (142, 70).
; PLAN: r0=142(x), r1=70(y), r2=48(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 70
LDI r2, 48
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
