; DESCRIPTION: Places a red 70x29 rectangle at position (244, 176).
; PLAN: r0=244(x), r1=176(y), r2=70(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 176
LDI r2, 70
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
