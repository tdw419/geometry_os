; DESCRIPTION: Creates a white rectangular region at (32, 124) spanning 33 by 46 pixels.
; PLAN: r0=32(x), r1=124(y), r2=33(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 124
LDI r2, 33
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
