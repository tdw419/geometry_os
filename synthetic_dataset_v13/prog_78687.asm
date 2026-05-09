; DESCRIPTION: Creates a blue rectangular region at (295, 77) spanning 113 by 62 pixels.
; PLAN: r0=295(x), r1=77(y), r2=113(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 77
LDI r2, 113
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
