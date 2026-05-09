; DESCRIPTION: Creates a red rectangular region at (279, 124) spanning 12 by 87 pixels.
; PLAN: r0=279(x), r1=124(y), r2=12(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 124
LDI r2, 12
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
