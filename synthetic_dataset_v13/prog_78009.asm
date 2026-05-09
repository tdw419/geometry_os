; DESCRIPTION: Creates a cyan rectangular region at (199, 130) spanning 20 by 71 pixels.
; PLAN: r0=199(x), r1=130(y), r2=20(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 130
LDI r2, 20
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
