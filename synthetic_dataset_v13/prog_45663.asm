; DESCRIPTION: Creates a black rectangular region at (328, 147) spanning 34 by 10 pixels.
; PLAN: r0=328(x), r1=147(y), r2=34(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 147
LDI r2, 34
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
