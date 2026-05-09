; DESCRIPTION: Places a orange 10x116 rectangle at position (374, 136).
; PLAN: r0=374(x), r1=136(y), r2=10(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 136
LDI r2, 10
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
