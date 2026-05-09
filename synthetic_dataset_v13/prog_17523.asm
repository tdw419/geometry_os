; DESCRIPTION: Creates a purple rectangular region at (87, 50) spanning 68 by 60 pixels.
; PLAN: r0=87(x), r1=50(y), r2=68(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 50
LDI r2, 68
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
