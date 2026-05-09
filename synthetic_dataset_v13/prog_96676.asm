; DESCRIPTION: Creates a purple rectangular region at (206, 46) spanning 90 by 98 pixels.
; PLAN: r0=206(x), r1=46(y), r2=90(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 46
LDI r2, 90
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
