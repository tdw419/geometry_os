; DESCRIPTION: Creates a yellow rectangular region at (179, 129) spanning 101 by 49 pixels.
; PLAN: r0=179(x), r1=129(y), r2=101(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 129
LDI r2, 101
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
