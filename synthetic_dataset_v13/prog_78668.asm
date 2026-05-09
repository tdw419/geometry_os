; DESCRIPTION: Creates a magenta rectangular region at (242, 109) spanning 102 by 33 pixels.
; PLAN: r0=242(x), r1=109(y), r2=102(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 109
LDI r2, 102
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
