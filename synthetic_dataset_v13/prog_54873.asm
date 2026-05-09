; DESCRIPTION: Creates a orange rectangular region at (48, 193) spanning 120 by 35 pixels.
; PLAN: r0=48(x), r1=193(y), r2=120(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 193
LDI r2, 120
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
