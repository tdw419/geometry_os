; DESCRIPTION: Creates a blue rectangular region at (238, 173) spanning 60 by 50 pixels.
; PLAN: r0=238(x), r1=173(y), r2=60(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 173
LDI r2, 60
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
