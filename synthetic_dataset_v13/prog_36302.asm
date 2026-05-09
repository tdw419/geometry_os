; DESCRIPTION: Creates a red rectangular region at (392, 32) spanning 37 by 43 pixels.
; PLAN: r0=392(x), r1=32(y), r2=37(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 32
LDI r2, 37
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
