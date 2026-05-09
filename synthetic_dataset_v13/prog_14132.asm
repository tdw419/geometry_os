; DESCRIPTION: Creates a white rectangular region at (414, 193) spanning 46 by 37 pixels.
; PLAN: r0=414(x), r1=193(y), r2=46(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 193
LDI r2, 46
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
