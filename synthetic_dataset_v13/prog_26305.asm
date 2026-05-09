; DESCRIPTION: Creates a blue rectangular region at (306, 180) spanning 59 by 12 pixels.
; PLAN: r0=306(x), r1=180(y), r2=59(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 180
LDI r2, 59
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
