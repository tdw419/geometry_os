; DESCRIPTION: Places a red 70x19 rectangle at position (168, 34).
; PLAN: r0=168(x), r1=34(y), r2=70(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 34
LDI r2, 70
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
