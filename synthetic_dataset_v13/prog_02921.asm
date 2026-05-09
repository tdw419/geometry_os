; DESCRIPTION: Creates a black rectangular region at (403, 32) spanning 25 by 21 pixels.
; PLAN: r0=403(x), r1=32(y), r2=25(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 32
LDI r2, 25
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
