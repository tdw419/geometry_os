; DESCRIPTION: Creates a blue rectangular region at (391, 134) spanning 27 by 66 pixels.
; PLAN: r0=391(x), r1=134(y), r2=27(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 134
LDI r2, 27
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
