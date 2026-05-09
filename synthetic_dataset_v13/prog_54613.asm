; DESCRIPTION: Creates a blue rectangular region at (295, 35) spanning 55 by 61 pixels.
; PLAN: r0=295(x), r1=35(y), r2=55(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 35
LDI r2, 55
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
