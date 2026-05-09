; DESCRIPTION: Creates a purple rectangular region at (42, 7) spanning 115 by 51 pixels.
; PLAN: r0=42(x), r1=7(y), r2=115(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 7
LDI r2, 115
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
