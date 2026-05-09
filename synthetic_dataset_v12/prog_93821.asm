; DESCRIPTION: Places a red 118x21 rectangle at position (228, 131).
; PLAN: r0=228(x), r1=131(y), r2=118(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 131
LDI r2, 118
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
