; DESCRIPTION: Places a red 76x94 rectangle at position (423, 50).
; PLAN: r0=423(x), r1=50(y), r2=76(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 50
LDI r2, 76
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
