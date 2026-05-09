; DESCRIPTION: Places a orange 112x100 rectangle at position (255, 19).
; PLAN: r0=255(x), r1=19(y), r2=112(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 19
LDI r2, 112
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
