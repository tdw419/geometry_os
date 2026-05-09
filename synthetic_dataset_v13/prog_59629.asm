; DESCRIPTION: Places a red 98x95 rectangle at position (310, 85).
; PLAN: r0=310(x), r1=85(y), r2=98(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 85
LDI r2, 98
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
