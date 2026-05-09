; DESCRIPTION: Creates a blue rectangular region at (450, 28) spanning 21 by 47 pixels.
; PLAN: r0=450(x), r1=28(y), r2=21(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 28
LDI r2, 21
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
