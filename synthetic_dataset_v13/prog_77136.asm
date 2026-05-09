; DESCRIPTION: Places a red 92x50 rectangle at position (120, 74).
; PLAN: r0=120(x), r1=74(y), r2=92(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 74
LDI r2, 92
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
