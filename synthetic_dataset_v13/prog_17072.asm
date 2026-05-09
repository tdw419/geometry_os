; DESCRIPTION: Places a white 118x18 rectangle at position (315, 128).
; PLAN: r0=315(x), r1=128(y), r2=118(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 128
LDI r2, 118
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
