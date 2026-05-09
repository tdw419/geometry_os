; DESCRIPTION: Places a white 96x54 rectangle at position (78, 121).
; PLAN: r0=78(x), r1=121(y), r2=96(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 121
LDI r2, 96
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
