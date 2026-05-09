; DESCRIPTION: Places a white 49x70 rectangle at position (317, 75).
; PLAN: r0=317(x), r1=75(y), r2=49(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 75
LDI r2, 49
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
