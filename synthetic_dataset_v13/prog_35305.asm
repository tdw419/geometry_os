; DESCRIPTION: Creates a yellow rectangular region at (394, 59) spanning 84 by 82 pixels.
; PLAN: r0=394(x), r1=59(y), r2=84(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 59
LDI r2, 84
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
