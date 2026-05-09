; DESCRIPTION: Places a red 115x38 rectangle at position (3, 134).
; PLAN: r0=3(x), r1=134(y), r2=115(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 134
LDI r2, 115
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
