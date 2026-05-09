; DESCRIPTION: Creates a blue rectangular region at (79, 71) spanning 85 by 90 pixels.
; PLAN: r0=79(x), r1=71(y), r2=85(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 71
LDI r2, 85
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
