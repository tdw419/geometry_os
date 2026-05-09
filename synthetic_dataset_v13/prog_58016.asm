; DESCRIPTION: Creates a cyan rectangular region at (455, 126) spanning 19 by 93 pixels.
; PLAN: r0=455(x), r1=126(y), r2=19(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 126
LDI r2, 19
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
