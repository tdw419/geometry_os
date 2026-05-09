; DESCRIPTION: Creates a blue rectangular region at (248, 12) spanning 87 by 61 pixels.
; PLAN: r0=248(x), r1=12(y), r2=87(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 12
LDI r2, 87
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
