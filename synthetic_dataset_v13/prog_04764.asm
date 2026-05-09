; DESCRIPTION: Creates a black rectangular region at (298, 42) spanning 59 by 62 pixels.
; PLAN: r0=298(x), r1=42(y), r2=59(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 42
LDI r2, 59
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
