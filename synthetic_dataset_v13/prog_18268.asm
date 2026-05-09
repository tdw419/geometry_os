; DESCRIPTION: Creates a blue rectangular region at (317, 47) spanning 53 by 37 pixels.
; PLAN: r0=317(x), r1=47(y), r2=53(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 47
LDI r2, 53
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
