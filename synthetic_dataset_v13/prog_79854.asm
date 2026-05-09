; DESCRIPTION: Creates a red rectangular region at (229, 45) spanning 83 by 27 pixels.
; PLAN: r0=229(x), r1=45(y), r2=83(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 45
LDI r2, 83
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
