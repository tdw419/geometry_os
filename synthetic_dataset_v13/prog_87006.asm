; DESCRIPTION: Creates a red rectangular region at (393, 36) spanning 111 by 75 pixels.
; PLAN: r0=393(x), r1=36(y), r2=111(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 36
LDI r2, 111
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
