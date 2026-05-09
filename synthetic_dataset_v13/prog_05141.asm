; DESCRIPTION: Places a red 119x92 rectangle at position (172, 158).
; PLAN: r0=172(x), r1=158(y), r2=119(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 158
LDI r2, 119
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
