; DESCRIPTION: Creates a blue rectangular region at (277, 59) spanning 83 by 111 pixels.
; PLAN: r0=277(x), r1=59(y), r2=83(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 59
LDI r2, 83
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
