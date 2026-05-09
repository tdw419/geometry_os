; DESCRIPTION: Creates a black rectangular region at (68, 193) spanning 65 by 36 pixels.
; PLAN: r0=68(x), r1=193(y), r2=65(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 193
LDI r2, 65
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
