; DESCRIPTION: Creates a white rectangular region at (371, 197) spanning 88 by 34 pixels.
; PLAN: r0=371(x), r1=197(y), r2=88(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 197
LDI r2, 88
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
