; DESCRIPTION: Creates a red rectangular region at (128, 190) spanning 20 by 65 pixels.
; PLAN: r0=128(x), r1=190(y), r2=20(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 190
LDI r2, 20
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
