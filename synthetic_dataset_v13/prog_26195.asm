; DESCRIPTION: Creates a red rectangular region at (328, 47) spanning 71 by 63 pixels.
; PLAN: r0=328(x), r1=47(y), r2=71(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 47
LDI r2, 71
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
