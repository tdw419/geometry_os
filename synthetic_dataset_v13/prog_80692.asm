; DESCRIPTION: Creates a yellow rectangular region at (138, 47) spanning 103 by 37 pixels.
; PLAN: r0=138(x), r1=47(y), r2=103(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 47
LDI r2, 103
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
