; DESCRIPTION: Places a blue 55x39 rectangle at position (85, 36).
; PLAN: r0=85(x), r1=36(y), r2=55(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 36
LDI r2, 55
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
