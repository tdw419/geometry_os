; DESCRIPTION: Creates a cyan rectangular region at (26, 0) spanning 45 by 71 pixels.
; PLAN: r0=26(x), r1=0(y), r2=45(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 0
LDI r2, 45
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
