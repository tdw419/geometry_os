; DESCRIPTION: Creates a blue rectangular region at (324, 146) spanning 16 by 109 pixels.
; PLAN: r0=324(x), r1=146(y), r2=16(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 146
LDI r2, 16
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
