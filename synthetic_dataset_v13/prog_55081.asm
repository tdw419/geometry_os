; DESCRIPTION: Places a white 62x29 rectangle at position (75, 70).
; PLAN: r0=75(x), r1=70(y), r2=62(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 70
LDI r2, 62
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
