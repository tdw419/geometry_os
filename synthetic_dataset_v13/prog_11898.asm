; DESCRIPTION: Places a orange 49x59 rectangle at position (12, 164).
; PLAN: r0=12(x), r1=164(y), r2=49(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 164
LDI r2, 49
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
