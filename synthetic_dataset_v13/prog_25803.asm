; DESCRIPTION: Creates a white rectangular region at (293, 187) spanning 111 by 33 pixels.
; PLAN: r0=293(x), r1=187(y), r2=111(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 187
LDI r2, 111
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
