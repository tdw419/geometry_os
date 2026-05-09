; DESCRIPTION: Creates a yellow rectangular region at (242, 86) spanning 33 by 84 pixels.
; PLAN: r0=242(x), r1=86(y), r2=33(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 86
LDI r2, 33
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
