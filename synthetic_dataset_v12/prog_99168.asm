; DESCRIPTION: Places a red 14x66 rectangle at position (309, 71).
; PLAN: r0=309(x), r1=71(y), r2=14(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 71
LDI r2, 14
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
