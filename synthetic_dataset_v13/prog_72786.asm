; DESCRIPTION: Creates a blue rectangular region at (322, 38) spanning 59 by 113 pixels.
; PLAN: r0=322(x), r1=38(y), r2=59(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 38
LDI r2, 59
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
