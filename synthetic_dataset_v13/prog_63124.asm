; DESCRIPTION: Creates a red rectangular region at (370, 36) spanning 90 by 103 pixels.
; PLAN: r0=370(x), r1=36(y), r2=90(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 36
LDI r2, 90
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
