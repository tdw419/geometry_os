; DESCRIPTION: Creates a cyan rectangular region at (212, 177) spanning 14 by 48 pixels.
; PLAN: r0=212(x), r1=177(y), r2=14(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 177
LDI r2, 14
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
