; DESCRIPTION: Places a red 57x12 rectangle at position (437, 19).
; PLAN: r0=437(x), r1=19(y), r2=57(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 19
LDI r2, 57
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
