; DESCRIPTION: Creates a blue rectangular region at (436, 82) spanning 68 by 65 pixels.
; PLAN: r0=436(x), r1=82(y), r2=68(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 82
LDI r2, 68
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
