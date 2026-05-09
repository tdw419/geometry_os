; DESCRIPTION: Creates a red rectangular region at (269, 7) spanning 93 by 80 pixels.
; PLAN: r0=269(x), r1=7(y), r2=93(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 7
LDI r2, 93
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
