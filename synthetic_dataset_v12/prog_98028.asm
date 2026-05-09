; DESCRIPTION: Creates a white rectangular region at (192, 194) spanning 94 by 47 pixels.
; PLAN: r0=192(x), r1=194(y), r2=94(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 194
LDI r2, 94
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
