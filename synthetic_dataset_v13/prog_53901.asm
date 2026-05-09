; DESCRIPTION: Creates a red rectangular region at (30, 0) spanning 91 by 46 pixels.
; PLAN: r0=30(x), r1=0(y), r2=91(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 0
LDI r2, 91
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
