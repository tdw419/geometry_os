; DESCRIPTION: Places a red 62x20 rectangle at position (310, 45).
; PLAN: r0=310(x), r1=45(y), r2=62(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 45
LDI r2, 62
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
