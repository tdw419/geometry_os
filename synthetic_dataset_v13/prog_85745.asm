; DESCRIPTION: Creates a red rectangular region at (479, 67) spanning 23 by 78 pixels.
; PLAN: r0=479(x), r1=67(y), r2=23(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 67
LDI r2, 23
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
