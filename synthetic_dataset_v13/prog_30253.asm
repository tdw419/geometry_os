; DESCRIPTION: Creates a blue rectangular region at (95, 107) spanning 39 by 77 pixels.
; PLAN: r0=95(x), r1=107(y), r2=39(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 107
LDI r2, 39
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
