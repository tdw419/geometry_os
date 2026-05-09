; DESCRIPTION: Creates a red rectangular region at (209, 30) spanning 14 by 94 pixels.
; PLAN: r0=209(x), r1=30(y), r2=14(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 30
LDI r2, 14
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
