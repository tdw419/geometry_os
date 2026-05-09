; DESCRIPTION: Creates a white rectangular region at (275, 86) spanning 111 by 80 pixels.
; PLAN: r0=275(x), r1=86(y), r2=111(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 86
LDI r2, 111
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
