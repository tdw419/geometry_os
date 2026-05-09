; DESCRIPTION: Creates a black rectangular region at (147, 98) spanning 98 by 42 pixels.
; PLAN: r0=147(x), r1=98(y), r2=98(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 98
LDI r2, 98
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
