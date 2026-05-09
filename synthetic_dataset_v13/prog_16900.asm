; DESCRIPTION: Creates a cyan rectangular region at (163, 112) spanning 15 by 120 pixels.
; PLAN: r0=163(x), r1=112(y), r2=15(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 112
LDI r2, 15
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
