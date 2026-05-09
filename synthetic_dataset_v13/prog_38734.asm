; DESCRIPTION: Creates a blue rectangular region at (460, 134) spanning 19 by 17 pixels.
; PLAN: r0=460(x), r1=134(y), r2=19(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 134
LDI r2, 19
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
