; DESCRIPTION: Creates a black rectangular region at (186, 59) spanning 12 by 75 pixels.
; PLAN: r0=186(x), r1=59(y), r2=12(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 59
LDI r2, 12
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
