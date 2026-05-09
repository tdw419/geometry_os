; DESCRIPTION: Creates a purple rectangular region at (109, 146) spanning 68 by 42 pixels.
; PLAN: r0=109(x), r1=146(y), r2=68(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 146
LDI r2, 68
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
