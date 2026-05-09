; DESCRIPTION: Creates a red rectangular region at (231, 6) spanning 103 by 86 pixels.
; PLAN: r0=231(x), r1=6(y), r2=103(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 6
LDI r2, 103
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
