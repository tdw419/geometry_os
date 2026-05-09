; DESCRIPTION: Creates a blue rectangular region at (210, 73) spanning 57 by 77 pixels.
; PLAN: r0=210(x), r1=73(y), r2=57(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 73
LDI r2, 57
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
