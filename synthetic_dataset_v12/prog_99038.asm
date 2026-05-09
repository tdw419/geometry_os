; DESCRIPTION: Creates a cyan rectangular region at (436, 11) spanning 24 by 113 pixels.
; PLAN: r0=436(x), r1=11(y), r2=24(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 11
LDI r2, 24
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
