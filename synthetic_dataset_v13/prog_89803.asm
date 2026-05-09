; DESCRIPTION: Creates a black rectangular region at (180, 156) spanning 64 by 57 pixels.
; PLAN: r0=180(x), r1=156(y), r2=64(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 156
LDI r2, 64
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
