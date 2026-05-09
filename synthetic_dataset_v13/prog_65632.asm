; DESCRIPTION: Places a red 16x88 rectangle at position (228, 94).
; PLAN: r0=228(x), r1=94(y), r2=16(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 94
LDI r2, 16
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
