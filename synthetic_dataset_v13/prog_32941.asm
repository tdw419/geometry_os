; DESCRIPTION: Creates a white rectangular region at (228, 38) spanning 98 by 86 pixels.
; PLAN: r0=228(x), r1=38(y), r2=98(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 38
LDI r2, 98
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
