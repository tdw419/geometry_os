; DESCRIPTION: Places a white 74x26 rectangle at position (434, 20).
; PLAN: r0=434(x), r1=20(y), r2=74(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 20
LDI r2, 74
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
