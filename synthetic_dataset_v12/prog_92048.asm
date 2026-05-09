; DESCRIPTION: Creates a red rectangular region at (242, 170) spanning 112 by 67 pixels.
; PLAN: r0=242(x), r1=170(y), r2=112(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 170
LDI r2, 112
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
