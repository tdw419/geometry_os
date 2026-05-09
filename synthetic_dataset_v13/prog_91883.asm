; DESCRIPTION: Places a red 89x65 rectangle at position (68, 167).
; PLAN: r0=68(x), r1=167(y), r2=89(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 167
LDI r2, 89
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
