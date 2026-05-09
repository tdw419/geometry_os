; DESCRIPTION: Creates a purple rectangular region at (242, 24) spanning 82 by 26 pixels.
; PLAN: r0=242(x), r1=24(y), r2=82(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 24
LDI r2, 82
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
