; DESCRIPTION: Creates a blue rectangular region at (242, 121) spanning 43 by 101 pixels.
; PLAN: r0=242(x), r1=121(y), r2=43(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 121
LDI r2, 43
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
