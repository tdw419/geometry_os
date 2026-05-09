; DESCRIPTION: Creates a purple rectangular region at (300, 97) spanning 42 by 107 pixels.
; PLAN: r0=300(x), r1=97(y), r2=42(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 97
LDI r2, 42
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
