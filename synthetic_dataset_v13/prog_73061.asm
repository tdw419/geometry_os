; DESCRIPTION: Creates a red rectangular region at (345, 114) spanning 65 by 120 pixels.
; PLAN: r0=345(x), r1=114(y), r2=65(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 114
LDI r2, 65
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
