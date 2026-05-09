; DESCRIPTION: Creates a blue rectangular region at (42, 44) spanning 39 by 18 pixels.
; PLAN: r0=42(x), r1=44(y), r2=39(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 44
LDI r2, 39
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
