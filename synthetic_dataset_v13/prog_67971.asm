; DESCRIPTION: Places a white 62x16 rectangle at position (96, 141).
; PLAN: r0=96(x), r1=141(y), r2=62(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 141
LDI r2, 62
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
