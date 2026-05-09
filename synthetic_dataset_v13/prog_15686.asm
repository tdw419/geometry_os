; DESCRIPTION: Creates a cyan rectangular region at (280, 112) spanning 92 by 74 pixels.
; PLAN: r0=280(x), r1=112(y), r2=92(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 112
LDI r2, 92
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
