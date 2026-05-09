; DESCRIPTION: Creates a blue rectangular region at (340, 39) spanning 17 by 25 pixels.
; PLAN: r0=340(x), r1=39(y), r2=17(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 39
LDI r2, 17
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
