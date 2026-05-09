; DESCRIPTION: Creates a blue rectangular region at (242, 108) spanning 14 by 41 pixels.
; PLAN: r0=242(x), r1=108(y), r2=14(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 108
LDI r2, 14
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
