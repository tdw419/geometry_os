; DESCRIPTION: Creates a red rectangular region at (326, 57) spanning 27 by 67 pixels.
; PLAN: r0=326(x), r1=57(y), r2=27(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 57
LDI r2, 27
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
