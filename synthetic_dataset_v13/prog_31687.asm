; DESCRIPTION: Creates a blue rectangular region at (408, 124) spanning 95 by 28 pixels.
; PLAN: r0=408(x), r1=124(y), r2=95(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 124
LDI r2, 95
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
