; DESCRIPTION: Creates a white rectangular region at (82, 214) spanning 97 by 17 pixels.
; PLAN: r0=82(x), r1=214(y), r2=97(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 214
LDI r2, 97
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
