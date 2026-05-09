; DESCRIPTION: Creates a cyan rectangular region at (373, 3) spanning 83 by 59 pixels.
; PLAN: r0=373(x), r1=3(y), r2=83(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 3
LDI r2, 83
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
