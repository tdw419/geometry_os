; DESCRIPTION: Places a white 86x62 rectangle at position (416, 139).
; PLAN: r0=416(x), r1=139(y), r2=86(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 139
LDI r2, 86
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
