; DESCRIPTION: Creates a white rectangular region at (186, 27) spanning 36 by 48 pixels.
; PLAN: r0=186(x), r1=27(y), r2=36(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 27
LDI r2, 36
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
