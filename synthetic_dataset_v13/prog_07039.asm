; DESCRIPTION: Creates a red rectangular region at (215, 54) spanning 76 by 77 pixels.
; PLAN: r0=215(x), r1=54(y), r2=76(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 54
LDI r2, 76
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
