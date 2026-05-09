; DESCRIPTION: Creates a white rectangular region at (242, 166) spanning 87 by 78 pixels.
; PLAN: r0=242(x), r1=166(y), r2=87(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 166
LDI r2, 87
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
