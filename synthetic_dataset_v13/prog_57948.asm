; DESCRIPTION: Creates a cyan rectangular region at (242, 172) spanning 89 by 61 pixels.
; PLAN: r0=242(x), r1=172(y), r2=89(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 172
LDI r2, 89
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
