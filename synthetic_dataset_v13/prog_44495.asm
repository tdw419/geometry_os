; DESCRIPTION: Creates a blue rectangular region at (172, 180) spanning 113 by 51 pixels.
; PLAN: r0=172(x), r1=180(y), r2=113(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 180
LDI r2, 113
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
