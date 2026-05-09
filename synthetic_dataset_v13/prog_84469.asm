; DESCRIPTION: Creates a red rectangular region at (271, 139) spanning 25 by 57 pixels.
; PLAN: r0=271(x), r1=139(y), r2=25(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 139
LDI r2, 25
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
