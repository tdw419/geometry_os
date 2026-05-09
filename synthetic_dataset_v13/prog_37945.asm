; DESCRIPTION: Creates a red rectangular region at (417, 0) spanning 29 by 20 pixels.
; PLAN: r0=417(x), r1=0(y), r2=29(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 0
LDI r2, 29
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
