; DESCRIPTION: Creates a red rectangular region at (342, 120) spanning 27 by 99 pixels.
; PLAN: r0=342(x), r1=120(y), r2=27(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 120
LDI r2, 27
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
