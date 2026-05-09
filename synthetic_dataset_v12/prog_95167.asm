; DESCRIPTION: Creates a black rectangular region at (295, 166) spanning 38 by 22 pixels.
; PLAN: r0=295(x), r1=166(y), r2=38(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 166
LDI r2, 38
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
