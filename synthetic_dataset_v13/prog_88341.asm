; DESCRIPTION: Creates a green rectangular region at (262, 238) spanning 71 by 18 pixels.
; PLAN: r0=262(x), r1=238(y), r2=71(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 238
LDI r2, 71
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
