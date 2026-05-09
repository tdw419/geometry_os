; DESCRIPTION: Creates a yellow rectangular region at (242, 131) spanning 88 by 68 pixels.
; PLAN: r0=242(x), r1=131(y), r2=88(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 131
LDI r2, 88
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
