; DESCRIPTION: Creates a purple rectangular region at (446, 98) spanning 37 by 24 pixels.
; PLAN: r0=446(x), r1=98(y), r2=37(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 98
LDI r2, 37
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
