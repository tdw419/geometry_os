; DESCRIPTION: Creates a blue rectangular region at (203, 9) spanning 87 by 113 pixels.
; PLAN: r0=203(x), r1=9(y), r2=87(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 9
LDI r2, 87
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
