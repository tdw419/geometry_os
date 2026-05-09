; DESCRIPTION: Creates a white rectangular region at (445, 164) spanning 55 by 29 pixels.
; PLAN: r0=445(x), r1=164(y), r2=55(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 164
LDI r2, 55
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
