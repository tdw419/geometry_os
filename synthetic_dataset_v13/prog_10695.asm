; DESCRIPTION: Creates a orange rectangular region at (236, 93) spanning 27 by 52 pixels.
; PLAN: r0=236(x), r1=93(y), r2=27(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 93
LDI r2, 27
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
