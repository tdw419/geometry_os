; DESCRIPTION: Creates a red rectangular region at (215, 17) spanning 98 by 48 pixels.
; PLAN: r0=215(x), r1=17(y), r2=98(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 17
LDI r2, 98
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
