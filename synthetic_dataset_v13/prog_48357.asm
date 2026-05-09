; DESCRIPTION: Creates a blue rectangular region at (300, 180) spanning 33 by 60 pixels.
; PLAN: r0=300(x), r1=180(y), r2=33(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 180
LDI r2, 33
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
