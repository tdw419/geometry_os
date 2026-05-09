; DESCRIPTION: Creates a cyan rectangular region at (59, 185) spanning 44 by 39 pixels.
; PLAN: r0=59(x), r1=185(y), r2=44(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 185
LDI r2, 44
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
