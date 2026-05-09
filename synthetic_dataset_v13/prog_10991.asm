; DESCRIPTION: Places a white 115x30 rectangle at position (356, 38).
; PLAN: r0=356(x), r1=38(y), r2=115(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 38
LDI r2, 115
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
