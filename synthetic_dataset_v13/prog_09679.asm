; DESCRIPTION: Creates a red rectangular region at (277, 120) spanning 90 by 36 pixels.
; PLAN: r0=277(x), r1=120(y), r2=90(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 120
LDI r2, 90
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
