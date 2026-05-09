; DESCRIPTION: Creates a red rectangular region at (172, 154) spanning 109 by 94 pixels.
; PLAN: r0=172(x), r1=154(y), r2=109(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 154
LDI r2, 109
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
