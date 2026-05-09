; DESCRIPTION: Creates a white rectangular region at (130, 72) spanning 12 by 107 pixels.
; PLAN: r0=130(x), r1=72(y), r2=12(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 72
LDI r2, 12
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
