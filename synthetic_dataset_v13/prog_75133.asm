; DESCRIPTION: Places a magenta 15x14 rectangle at position (303, 5).
; PLAN: r0=303(x), r1=5(y), r2=15(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 5
LDI r2, 15
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
