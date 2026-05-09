; DESCRIPTION: Creates a black rectangular region at (242, 162) spanning 43 by 66 pixels.
; PLAN: r0=242(x), r1=162(y), r2=43(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 162
LDI r2, 43
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
