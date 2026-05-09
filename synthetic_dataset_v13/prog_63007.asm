; DESCRIPTION: Places a red 96x82 rectangle at position (331, 136).
; PLAN: r0=331(x), r1=136(y), r2=96(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 136
LDI r2, 96
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
