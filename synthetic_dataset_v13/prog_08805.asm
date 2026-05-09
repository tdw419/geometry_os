; DESCRIPTION: Places a red 118x15 rectangle at position (50, 40).
; PLAN: r0=50(x), r1=40(y), r2=118(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 40
LDI r2, 118
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
