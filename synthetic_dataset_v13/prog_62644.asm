; DESCRIPTION: Creates a blue rectangular region at (354, 7) spanning 28 by 87 pixels.
; PLAN: r0=354(x), r1=7(y), r2=28(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 7
LDI r2, 28
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
