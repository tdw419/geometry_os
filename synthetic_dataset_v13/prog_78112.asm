; DESCRIPTION: Creates a cyan rectangular region at (247, 153) spanning 28 by 54 pixels.
; PLAN: r0=247(x), r1=153(y), r2=28(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 153
LDI r2, 28
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
