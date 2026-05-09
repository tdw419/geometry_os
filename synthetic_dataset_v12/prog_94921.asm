; DESCRIPTION: Places a red 18x74 rectangle at position (57, 20).
; PLAN: r0=57(x), r1=20(y), r2=18(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 20
LDI r2, 18
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
