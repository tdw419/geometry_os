; DESCRIPTION: Places a white 90x95 rectangle at position (122, 157).
; PLAN: r0=122(x), r1=157(y), r2=90(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 157
LDI r2, 90
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
