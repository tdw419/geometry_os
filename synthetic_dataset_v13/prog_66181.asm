; DESCRIPTION: Creates a blue rectangular region at (355, 204) spanning 77 by 43 pixels.
; PLAN: r0=355(x), r1=204(y), r2=77(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 204
LDI r2, 77
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
