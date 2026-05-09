; DESCRIPTION: Places a orange 65x25 rectangle at position (173, 53).
; PLAN: r0=173(x), r1=53(y), r2=65(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 53
LDI r2, 65
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
