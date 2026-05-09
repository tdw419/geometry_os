; DESCRIPTION: Creates a yellow rectangular region at (59, 112) spanning 24 by 76 pixels.
; PLAN: r0=59(x), r1=112(y), r2=24(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 112
LDI r2, 24
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
