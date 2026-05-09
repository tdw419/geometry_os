; DESCRIPTION: Creates a black rectangular region at (363, 4) spanning 18 by 42 pixels.
; PLAN: r0=363(x), r1=4(y), r2=18(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 4
LDI r2, 18
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
