; DESCRIPTION: Creates a yellow rectangular region at (130, 129) spanning 87 by 116 pixels.
; PLAN: r0=130(x), r1=129(y), r2=87(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 129
LDI r2, 87
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
