; DESCRIPTION: Creates a cyan rectangular region at (153, 6) spanning 103 by 93 pixels.
; PLAN: r0=153(x), r1=6(y), r2=103(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 6
LDI r2, 103
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
