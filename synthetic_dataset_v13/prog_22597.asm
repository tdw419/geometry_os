; DESCRIPTION: Creates a yellow rectangular region at (66, 147) spanning 64 by 71 pixels.
; PLAN: r0=66(x), r1=147(y), r2=64(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 147
LDI r2, 64
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
