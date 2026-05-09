; DESCRIPTION: Creates a red rectangular region at (243, 126) spanning 99 by 25 pixels.
; PLAN: r0=243(x), r1=126(y), r2=99(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 126
LDI r2, 99
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
