; DESCRIPTION: Creates a black rectangular region at (192, 195) spanning 54 by 10 pixels.
; PLAN: r0=192(x), r1=195(y), r2=54(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 195
LDI r2, 54
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
