; DESCRIPTION: Creates a cyan rectangular region at (238, 5) spanning 74 by 59 pixels.
; PLAN: r0=238(x), r1=5(y), r2=74(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 5
LDI r2, 74
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
