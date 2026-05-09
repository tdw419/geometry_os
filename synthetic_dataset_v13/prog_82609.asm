; DESCRIPTION: Creates a blue rectangular region at (71, 242) spanning 74 by 14 pixels.
; PLAN: r0=71(x), r1=242(y), r2=74(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 242
LDI r2, 74
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
