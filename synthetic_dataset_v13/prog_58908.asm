; DESCRIPTION: Places a orange 112x29 rectangle at position (29, 90).
; PLAN: r0=29(x), r1=90(y), r2=112(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 90
LDI r2, 112
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
