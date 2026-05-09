; DESCRIPTION: Creates a blue rectangular region at (245, 159) spanning 104 by 93 pixels.
; PLAN: r0=245(x), r1=159(y), r2=104(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 159
LDI r2, 104
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
