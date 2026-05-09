; DESCRIPTION: Places a red 53x99 rectangle at position (338, 28).
; PLAN: r0=338(x), r1=28(y), r2=53(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 28
LDI r2, 53
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
