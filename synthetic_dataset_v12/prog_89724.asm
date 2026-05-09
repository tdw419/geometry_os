; DESCRIPTION: Places a black 53x55 rectangle at position (416, 95).
; PLAN: r0=416(x), r1=95(y), r2=53(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 95
LDI r2, 53
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
