; DESCRIPTION: Creates a magenta rectangular region at (332, 129) spanning 25 by 51 pixels.
; PLAN: r0=332(x), r1=129(y), r2=25(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 129
LDI r2, 25
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
