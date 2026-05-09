; DESCRIPTION: Places a white 16x74 rectangle at position (30, 115).
; PLAN: r0=30(x), r1=115(y), r2=16(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 115
LDI r2, 16
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
