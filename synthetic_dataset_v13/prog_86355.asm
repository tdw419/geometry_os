; DESCRIPTION: Creates a blue rectangular region at (27, 27) spanning 83 by 95 pixels.
; PLAN: r0=27(x), r1=27(y), r2=83(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 27
LDI r2, 83
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
