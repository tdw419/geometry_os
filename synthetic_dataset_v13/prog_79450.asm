; DESCRIPTION: Creates a white rectangular region at (267, 124) spanning 37 by 94 pixels.
; PLAN: r0=267(x), r1=124(y), r2=37(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 124
LDI r2, 37
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
