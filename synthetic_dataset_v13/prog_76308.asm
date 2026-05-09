; DESCRIPTION: Renders a white box of size 108x47 starting at (309, 61).
; PLAN: r0=309(x), r1=61(y), r2=108(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 61
LDI r2, 108
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
