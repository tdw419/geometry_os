; DESCRIPTION: Places a white 25x55 rectangle at position (334, 100).
; PLAN: r0=334(x), r1=100(y), r2=25(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 100
LDI r2, 25
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
