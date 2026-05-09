; DESCRIPTION: Creates a blue rectangular region at (21, 168) spanning 27 by 66 pixels.
; PLAN: r0=21(x), r1=168(y), r2=27(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 168
LDI r2, 27
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
