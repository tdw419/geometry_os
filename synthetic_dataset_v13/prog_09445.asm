; DESCRIPTION: Creates a blue rectangular region at (190, 5) spanning 27 by 112 pixels.
; PLAN: r0=190(x), r1=5(y), r2=27(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 5
LDI r2, 27
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
