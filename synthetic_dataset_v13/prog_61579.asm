; DESCRIPTION: Creates a red rectangular region at (176, 58) spanning 94 by 120 pixels.
; PLAN: r0=176(x), r1=58(y), r2=94(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 58
LDI r2, 94
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
