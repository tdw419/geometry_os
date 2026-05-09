; DESCRIPTION: Creates a red rectangular region at (243, 53) spanning 49 by 120 pixels.
; PLAN: r0=243(x), r1=53(y), r2=49(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 53
LDI r2, 49
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
