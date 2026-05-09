; DESCRIPTION: Creates a white rectangular region at (445, 60) spanning 46 by 67 pixels.
; PLAN: r0=445(x), r1=60(y), r2=46(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 60
LDI r2, 46
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
