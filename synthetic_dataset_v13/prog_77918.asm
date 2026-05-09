; DESCRIPTION: Creates a red rectangular region at (363, 216) spanning 103 by 23 pixels.
; PLAN: r0=363(x), r1=216(y), r2=103(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 216
LDI r2, 103
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
