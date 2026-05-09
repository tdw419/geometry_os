; DESCRIPTION: Creates a blue rectangular region at (57, 131) spanning 42 by 99 pixels.
; PLAN: r0=57(x), r1=131(y), r2=42(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 131
LDI r2, 42
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
