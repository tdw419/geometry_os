; DESCRIPTION: Creates a green rectangular region at (59, 29) spanning 82 by 68 pixels.
; PLAN: r0=59(x), r1=29(y), r2=82(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 29
LDI r2, 82
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
