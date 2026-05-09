; DESCRIPTION: Creates a red rectangular region at (217, 210) spanning 80 by 27 pixels.
; PLAN: r0=217(x), r1=210(y), r2=80(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 210
LDI r2, 80
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
