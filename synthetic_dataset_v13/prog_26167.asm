; DESCRIPTION: Places a orange 73x48 rectangle at position (320, 69).
; PLAN: r0=320(x), r1=69(y), r2=73(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 69
LDI r2, 73
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
