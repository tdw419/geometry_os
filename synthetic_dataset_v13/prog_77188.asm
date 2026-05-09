; DESCRIPTION: Creates a blue rectangular region at (281, 28) spanning 47 by 26 pixels.
; PLAN: r0=281(x), r1=28(y), r2=47(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 28
LDI r2, 47
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
