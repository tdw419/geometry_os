; DESCRIPTION: Creates a black rectangular region at (326, 194) spanning 77 by 31 pixels.
; PLAN: r0=326(x), r1=194(y), r2=77(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 194
LDI r2, 77
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
