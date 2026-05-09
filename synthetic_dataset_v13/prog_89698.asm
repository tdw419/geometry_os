; DESCRIPTION: Creates a red rectangular region at (107, 126) spanning 115 by 86 pixels.
; PLAN: r0=107(x), r1=126(y), r2=115(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 126
LDI r2, 115
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
