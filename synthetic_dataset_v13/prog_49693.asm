; DESCRIPTION: Creates a white rectangular region at (367, 65) spanning 111 by 28 pixels.
; PLAN: r0=367(x), r1=65(y), r2=111(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 65
LDI r2, 111
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
