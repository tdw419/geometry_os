; DESCRIPTION: Places a red 32x78 rectangle at position (207, 142).
; PLAN: r0=207(x), r1=142(y), r2=32(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 142
LDI r2, 32
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
