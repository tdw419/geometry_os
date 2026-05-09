; DESCRIPTION: Creates a yellow rectangular region at (221, 10) spanning 98 by 67 pixels.
; PLAN: r0=221(x), r1=10(y), r2=98(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 10
LDI r2, 98
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
