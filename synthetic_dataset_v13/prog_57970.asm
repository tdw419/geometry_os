; DESCRIPTION: Places a red 113x19 rectangle at position (375, 102).
; PLAN: r0=375(x), r1=102(y), r2=113(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 102
LDI r2, 113
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
