; DESCRIPTION: Creates a purple rectangular region at (220, 27) spanning 68 by 103 pixels.
; PLAN: r0=220(x), r1=27(y), r2=68(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 27
LDI r2, 68
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
