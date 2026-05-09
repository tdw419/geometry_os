; DESCRIPTION: Creates a blue rectangular region at (154, 65) spanning 86 by 65 pixels.
; PLAN: r0=154(x), r1=65(y), r2=86(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 65
LDI r2, 86
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
