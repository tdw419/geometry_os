; DESCRIPTION: Creates a black rectangular region at (239, 184) spanning 94 by 10 pixels.
; PLAN: r0=239(x), r1=184(y), r2=94(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 184
LDI r2, 94
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
