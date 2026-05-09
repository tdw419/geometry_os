; DESCRIPTION: Places a orange 59x112 rectangle at position (384, 70).
; PLAN: r0=384(x), r1=70(y), r2=59(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 70
LDI r2, 59
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
