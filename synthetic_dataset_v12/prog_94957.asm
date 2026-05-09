; DESCRIPTION: Creates a white rectangular region at (86, 194) spanning 91 by 33 pixels.
; PLAN: r0=86(x), r1=194(y), r2=91(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 194
LDI r2, 91
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
