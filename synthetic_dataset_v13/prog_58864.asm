; DESCRIPTION: Creates a orange rectangular region at (255, 17) spanning 93 by 32 pixels.
; PLAN: r0=255(x), r1=17(y), r2=93(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 17
LDI r2, 93
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
