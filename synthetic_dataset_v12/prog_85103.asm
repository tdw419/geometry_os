; DESCRIPTION: Creates a blue rectangular region at (213, 74) spanning 60 by 85 pixels.
; PLAN: r0=213(x), r1=74(y), r2=60(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 74
LDI r2, 60
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
