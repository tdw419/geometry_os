; DESCRIPTION: Creates a red rectangular region at (226, 215) spanning 99 by 38 pixels.
; PLAN: r0=226(x), r1=215(y), r2=99(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 215
LDI r2, 99
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
