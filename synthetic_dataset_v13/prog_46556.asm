; DESCRIPTION: Creates a white rectangular region at (87, 29) spanning 83 by 59 pixels.
; PLAN: r0=87(x), r1=29(y), r2=83(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 29
LDI r2, 83
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
