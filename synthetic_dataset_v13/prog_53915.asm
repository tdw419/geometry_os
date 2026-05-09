; DESCRIPTION: Creates a white rectangular region at (377, 20) spanning 40 by 86 pixels.
; PLAN: r0=377(x), r1=20(y), r2=40(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 20
LDI r2, 40
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
