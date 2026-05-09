; DESCRIPTION: Creates a yellow rectangular region at (337, 164) spanning 59 by 47 pixels.
; PLAN: r0=337(x), r1=164(y), r2=59(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 164
LDI r2, 59
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
