; DESCRIPTION: Places a yellow 74x108 rectangle at position (161, 42).
; PLAN: r0=161(x), r1=42(y), r2=74(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 42
LDI r2, 74
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
