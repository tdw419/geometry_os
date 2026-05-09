; DESCRIPTION: Creates a red rectangular region at (264, 145) spanning 120 by 39 pixels.
; PLAN: r0=264(x), r1=145(y), r2=120(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 145
LDI r2, 120
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
