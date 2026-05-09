; DESCRIPTION: Places a blue 108x116 rectangle at position (214, 119).
; PLAN: r0=214(x), r1=119(y), r2=108(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 119
LDI r2, 108
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
