; DESCRIPTION: Creates a purple rectangular region at (184, 242) spanning 28 by 11 pixels.
; PLAN: r0=184(x), r1=242(y), r2=28(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 242
LDI r2, 28
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
