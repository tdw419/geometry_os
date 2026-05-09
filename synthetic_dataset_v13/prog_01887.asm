; DESCRIPTION: Places a red 52x103 rectangle at position (327, 70).
; PLAN: r0=327(x), r1=70(y), r2=52(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 70
LDI r2, 52
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
