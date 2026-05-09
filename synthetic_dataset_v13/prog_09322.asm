; DESCRIPTION: Creates a blue rectangular region at (39, 152) spanning 38 by 75 pixels.
; PLAN: r0=39(x), r1=152(y), r2=38(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 152
LDI r2, 38
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
