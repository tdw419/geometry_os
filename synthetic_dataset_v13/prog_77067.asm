; DESCRIPTION: Creates a blue rectangular region at (82, 179) spanning 77 by 77 pixels.
; PLAN: r0=82(x), r1=179(y), r2=77(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 179
LDI r2, 77
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
