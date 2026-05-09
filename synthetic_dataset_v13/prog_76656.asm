; DESCRIPTION: Creates a white rectangular region at (48, 94) spanning 91 by 37 pixels.
; PLAN: r0=48(x), r1=94(y), r2=91(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 94
LDI r2, 91
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
