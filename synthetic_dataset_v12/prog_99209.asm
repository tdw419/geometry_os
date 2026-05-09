; DESCRIPTION: Places a red 28x92 rectangle at position (311, 50).
; PLAN: r0=311(x), r1=50(y), r2=28(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 50
LDI r2, 28
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
