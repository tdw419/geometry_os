; DESCRIPTION: Creates a blue rectangular region at (422, 111) spanning 63 by 93 pixels.
; PLAN: r0=422(x), r1=111(y), r2=63(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 111
LDI r2, 63
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
