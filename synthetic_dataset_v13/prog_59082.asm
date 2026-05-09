; DESCRIPTION: Creates a red rectangular region at (123, 147) spanning 61 by 103 pixels.
; PLAN: r0=123(x), r1=147(y), r2=61(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 147
LDI r2, 61
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
