; DESCRIPTION: Places a red 18x35 rectangle at position (317, 161).
; PLAN: r0=317(x), r1=161(y), r2=18(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 161
LDI r2, 18
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
