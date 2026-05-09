; DESCRIPTION: Creates a blue rectangular region at (168, 111) spanning 51 by 57 pixels.
; PLAN: r0=168(x), r1=111(y), r2=51(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 111
LDI r2, 51
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
