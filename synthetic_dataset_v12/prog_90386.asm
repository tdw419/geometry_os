; DESCRIPTION: Creates a red rectangular region at (202, 19) spanning 91 by 77 pixels.
; PLAN: r0=202(x), r1=19(y), r2=91(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 19
LDI r2, 91
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
