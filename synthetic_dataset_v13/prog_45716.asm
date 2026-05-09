; DESCRIPTION: Places a red 50x98 rectangle at position (395, 67).
; PLAN: r0=395(x), r1=67(y), r2=50(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 67
LDI r2, 50
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
