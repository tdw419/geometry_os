; DESCRIPTION: Places a white 30x20 rectangle at position (111, 74).
; PLAN: r0=111(x), r1=74(y), r2=30(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 74
LDI r2, 30
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
