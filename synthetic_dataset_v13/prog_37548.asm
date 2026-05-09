; DESCRIPTION: Creates a red rectangular region at (345, 149) spanning 23 by 28 pixels.
; PLAN: r0=345(x), r1=149(y), r2=23(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 149
LDI r2, 23
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
