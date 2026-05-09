; DESCRIPTION: Creates a white rectangular region at (371, 167) spanning 94 by 46 pixels.
; PLAN: r0=371(x), r1=167(y), r2=94(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 167
LDI r2, 94
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
