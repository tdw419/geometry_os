; DESCRIPTION: Creates a red rectangular region at (180, 39) spanning 56 by 78 pixels.
; PLAN: r0=180(x), r1=39(y), r2=56(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 39
LDI r2, 56
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
