; DESCRIPTION: Creates a yellow rectangular region at (353, 165) spanning 109 by 32 pixels.
; PLAN: r0=353(x), r1=165(y), r2=109(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 165
LDI r2, 109
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
