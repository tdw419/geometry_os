; DESCRIPTION: Creates a cyan rectangular region at (330, 35) spanning 24 by 81 pixels.
; PLAN: r0=330(x), r1=35(y), r2=24(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 35
LDI r2, 24
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
