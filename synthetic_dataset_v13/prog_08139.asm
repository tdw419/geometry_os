; DESCRIPTION: Creates a red rectangular region at (237, 190) spanning 48 by 60 pixels.
; PLAN: r0=237(x), r1=190(y), r2=48(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 190
LDI r2, 48
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
