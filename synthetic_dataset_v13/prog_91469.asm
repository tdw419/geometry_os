; DESCRIPTION: Creates a cyan rectangular region at (190, 167) spanning 45 by 20 pixels.
; PLAN: r0=190(x), r1=167(y), r2=45(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 167
LDI r2, 45
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
