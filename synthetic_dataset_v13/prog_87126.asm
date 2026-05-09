; DESCRIPTION: Creates a red rectangular region at (370, 86) spanning 77 by 91 pixels.
; PLAN: r0=370(x), r1=86(y), r2=77(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 86
LDI r2, 77
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
