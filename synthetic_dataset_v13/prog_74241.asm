; DESCRIPTION: Creates a white rectangular region at (209, 107) spanning 98 by 90 pixels.
; PLAN: r0=209(x), r1=107(y), r2=98(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 107
LDI r2, 98
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
