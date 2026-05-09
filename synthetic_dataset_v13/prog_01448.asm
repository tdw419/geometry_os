; DESCRIPTION: Creates a blue rectangular region at (387, 108) spanning 109 by 70 pixels.
; PLAN: r0=387(x), r1=108(y), r2=109(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 108
LDI r2, 109
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
