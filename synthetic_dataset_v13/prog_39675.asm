; DESCRIPTION: Creates a orange rectangular region at (168, 189) spanning 93 by 52 pixels.
; PLAN: r0=168(x), r1=189(y), r2=93(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 189
LDI r2, 93
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
