; DESCRIPTION: Creates a cyan rectangular region at (92, 98) spanning 71 by 80 pixels.
; PLAN: r0=92(x), r1=98(y), r2=71(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 98
LDI r2, 71
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
