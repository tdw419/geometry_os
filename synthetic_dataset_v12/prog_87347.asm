; DESCRIPTION: Creates a yellow rectangular region at (48, 223) spanning 69 by 28 pixels.
; PLAN: r0=48(x), r1=223(y), r2=69(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 223
LDI r2, 69
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
