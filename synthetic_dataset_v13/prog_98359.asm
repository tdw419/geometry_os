; DESCRIPTION: Creates a cyan rectangular region at (279, 137) spanning 93 by 12 pixels.
; PLAN: r0=279(x), r1=137(y), r2=93(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 137
LDI r2, 93
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
