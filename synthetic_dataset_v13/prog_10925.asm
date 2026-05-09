; DESCRIPTION: Creates a blue rectangular region at (276, 28) spanning 87 by 57 pixels.
; PLAN: r0=276(x), r1=28(y), r2=87(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 28
LDI r2, 87
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
