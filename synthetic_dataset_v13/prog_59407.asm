; DESCRIPTION: Places a orange 84x76 rectangle at position (398, 53).
; PLAN: r0=398(x), r1=53(y), r2=84(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 53
LDI r2, 84
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
