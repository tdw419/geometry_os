; DESCRIPTION: Places a white 74x69 rectangle at position (27, 54).
; PLAN: r0=27(x), r1=54(y), r2=74(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 54
LDI r2, 74
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
