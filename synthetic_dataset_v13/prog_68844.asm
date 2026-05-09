; DESCRIPTION: Creates a black rectangular region at (447, 27) spanning 42 by 97 pixels.
; PLAN: r0=447(x), r1=27(y), r2=42(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 27
LDI r2, 42
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
