; DESCRIPTION: Creates a blue rectangular region at (398, 39) spanning 72 by 90 pixels.
; PLAN: r0=398(x), r1=39(y), r2=72(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 39
LDI r2, 72
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
