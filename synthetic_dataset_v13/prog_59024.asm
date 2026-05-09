; DESCRIPTION: Places a white 75x15 rectangle at position (317, 102).
; PLAN: r0=317(x), r1=102(y), r2=75(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 102
LDI r2, 75
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
