; DESCRIPTION: Creates a black rectangular region at (180, 146) spanning 64 by 102 pixels.
; PLAN: r0=180(x), r1=146(y), r2=64(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 146
LDI r2, 64
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
