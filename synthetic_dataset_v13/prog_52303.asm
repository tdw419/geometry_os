; DESCRIPTION: Places a orange 119x116 rectangle at position (332, 136).
; PLAN: r0=332(x), r1=136(y), r2=119(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 136
LDI r2, 119
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
