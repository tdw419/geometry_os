; DESCRIPTION: Creates a red rectangular region at (178, 195) spanning 64 by 18 pixels.
; PLAN: r0=178(x), r1=195(y), r2=64(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 195
LDI r2, 64
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
