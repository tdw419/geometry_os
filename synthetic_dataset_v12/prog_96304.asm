; DESCRIPTION: Creates a black rectangular region at (242, 92) spanning 109 by 43 pixels.
; PLAN: r0=242(x), r1=92(y), r2=109(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 92
LDI r2, 109
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
