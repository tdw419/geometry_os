; DESCRIPTION: Creates a white rectangular region at (367, 208) spanning 55 by 46 pixels.
; PLAN: r0=367(x), r1=208(y), r2=55(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 208
LDI r2, 55
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
