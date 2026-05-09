; DESCRIPTION: Creates a blue rectangular region at (298, 116) spanning 33 by 99 pixels.
; PLAN: r0=298(x), r1=116(y), r2=33(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 116
LDI r2, 33
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
