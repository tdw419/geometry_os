; DESCRIPTION: Places a orange 112x84 rectangle at position (221, 136).
; PLAN: r0=221(x), r1=136(y), r2=112(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 136
LDI r2, 112
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
