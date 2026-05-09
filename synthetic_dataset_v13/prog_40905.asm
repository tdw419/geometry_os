; DESCRIPTION: Creates a blue rectangular region at (412, 209) spanning 38 by 16 pixels.
; PLAN: r0=412(x), r1=209(y), r2=38(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 209
LDI r2, 38
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
