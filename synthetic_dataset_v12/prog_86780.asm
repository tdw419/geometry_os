; DESCRIPTION: Places a green 112x59 rectangle at position (25, 122).
; PLAN: r0=25(x), r1=122(y), r2=112(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 122
LDI r2, 112
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
