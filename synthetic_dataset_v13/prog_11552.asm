; DESCRIPTION: Creates a white rectangular region at (398, 199) spanning 112 by 46 pixels.
; PLAN: r0=398(x), r1=199(y), r2=112(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 199
LDI r2, 112
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
