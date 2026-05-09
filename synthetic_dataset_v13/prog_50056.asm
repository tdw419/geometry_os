; DESCRIPTION: Creates a red rectangular region at (417, 94) spanning 59 by 25 pixels.
; PLAN: r0=417(x), r1=94(y), r2=59(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 94
LDI r2, 59
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
