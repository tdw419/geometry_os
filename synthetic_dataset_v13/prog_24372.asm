; DESCRIPTION: Creates a blue rectangular region at (202, 215) spanning 100 by 23 pixels.
; PLAN: r0=202(x), r1=215(y), r2=100(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 215
LDI r2, 100
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
