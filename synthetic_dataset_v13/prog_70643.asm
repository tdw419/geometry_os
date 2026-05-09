; DESCRIPTION: Creates a red rectangular region at (44, 0) spanning 46 by 91 pixels.
; PLAN: r0=44(x), r1=0(y), r2=46(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 0
LDI r2, 46
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
