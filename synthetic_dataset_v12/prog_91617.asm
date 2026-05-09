; DESCRIPTION: Creates a red rectangular region at (362, 71) spanning 47 by 32 pixels.
; PLAN: r0=362(x), r1=71(y), r2=47(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 71
LDI r2, 47
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
