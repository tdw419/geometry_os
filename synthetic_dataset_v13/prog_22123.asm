; DESCRIPTION: Creates a white rectangular region at (340, 179) spanning 37 by 59 pixels.
; PLAN: r0=340(x), r1=179(y), r2=37(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 179
LDI r2, 37
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
