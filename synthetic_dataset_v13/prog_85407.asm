; DESCRIPTION: Creates a purple rectangular region at (187, 111) spanning 112 by 42 pixels.
; PLAN: r0=187(x), r1=111(y), r2=112(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 111
LDI r2, 112
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
