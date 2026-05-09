; DESCRIPTION: Creates a yellow rectangular region at (130, 154) spanning 57 by 12 pixels.
; PLAN: r0=130(x), r1=154(y), r2=57(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 154
LDI r2, 57
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
