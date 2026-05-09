; DESCRIPTION: Creates a black rectangular region at (445, 107) spanning 66 by 70 pixels.
; PLAN: r0=445(x), r1=107(y), r2=66(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 107
LDI r2, 66
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
