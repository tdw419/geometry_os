; DESCRIPTION: Creates a blue rectangular region at (92, 59) spanning 107 by 79 pixels.
; PLAN: r0=92(x), r1=59(y), r2=107(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 59
LDI r2, 107
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
