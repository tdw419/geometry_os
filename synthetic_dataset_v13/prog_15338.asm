; DESCRIPTION: Creates a cyan rectangular region at (242, 55) spanning 44 by 28 pixels.
; PLAN: r0=242(x), r1=55(y), r2=44(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 55
LDI r2, 44
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
