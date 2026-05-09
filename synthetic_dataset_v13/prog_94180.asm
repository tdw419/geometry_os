; DESCRIPTION: Places a white 57x96 rectangle at position (230, 33).
; PLAN: r0=230(x), r1=33(y), r2=57(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 33
LDI r2, 57
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
