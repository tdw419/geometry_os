; DESCRIPTION: Creates a blue rectangular region at (464, 209) spanning 24 by 29 pixels.
; PLAN: r0=464(x), r1=209(y), r2=24(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 209
LDI r2, 24
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
