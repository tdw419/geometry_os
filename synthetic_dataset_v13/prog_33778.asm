; DESCRIPTION: Creates a purple rectangular region at (111, 89) spanning 59 by 42 pixels.
; PLAN: r0=111(x), r1=89(y), r2=59(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 89
LDI r2, 59
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
