; DESCRIPTION: Creates a red rectangular region at (326, 12) spanning 18 by 94 pixels.
; PLAN: r0=326(x), r1=12(y), r2=18(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 12
LDI r2, 18
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
