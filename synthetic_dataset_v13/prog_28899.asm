; DESCRIPTION: Creates a black rectangular region at (349, 93) spanning 120 by 64 pixels.
; PLAN: r0=349(x), r1=93(y), r2=120(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 93
LDI r2, 120
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
