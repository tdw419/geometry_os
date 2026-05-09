; DESCRIPTION: Creates a blue rectangular region at (39, 223) spanning 56 by 11 pixels.
; PLAN: r0=39(x), r1=223(y), r2=56(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 223
LDI r2, 56
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
