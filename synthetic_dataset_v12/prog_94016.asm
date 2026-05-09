; DESCRIPTION: Creates a white rectangular region at (180, 192) spanning 52 by 57 pixels.
; PLAN: r0=180(x), r1=192(y), r2=52(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 192
LDI r2, 52
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
