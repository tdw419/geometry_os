; DESCRIPTION: Creates a yellow rectangular region at (243, 95) spanning 39 by 58 pixels.
; PLAN: r0=243(x), r1=95(y), r2=39(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 95
LDI r2, 39
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
