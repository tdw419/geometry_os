; DESCRIPTION: Creates a red rectangular region at (131, 86) spanning 94 by 39 pixels.
; PLAN: r0=131(x), r1=86(y), r2=94(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 86
LDI r2, 94
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
