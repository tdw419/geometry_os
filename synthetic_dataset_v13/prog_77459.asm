; DESCRIPTION: Creates a blue rectangular region at (405, 146) spanning 52 by 92 pixels.
; PLAN: r0=405(x), r1=146(y), r2=52(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 146
LDI r2, 52
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
