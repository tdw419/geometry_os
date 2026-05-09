; DESCRIPTION: Creates a blue rectangular region at (425, 151) spanning 54 by 32 pixels.
; PLAN: r0=425(x), r1=151(y), r2=54(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 151
LDI r2, 54
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
