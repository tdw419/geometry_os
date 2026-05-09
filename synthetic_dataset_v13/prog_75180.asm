; DESCRIPTION: Creates a cyan rectangular region at (297, 6) spanning 90 by 98 pixels.
; PLAN: r0=297(x), r1=6(y), r2=90(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 6
LDI r2, 90
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
