; DESCRIPTION: Creates a red rectangular region at (352, 91) spanning 40 by 46 pixels.
; PLAN: r0=352(x), r1=91(y), r2=40(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 91
LDI r2, 40
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
