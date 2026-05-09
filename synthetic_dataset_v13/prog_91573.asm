; DESCRIPTION: Creates a magenta rectangular region at (442, 129) spanning 51 by 63 pixels.
; PLAN: r0=442(x), r1=129(y), r2=51(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 129
LDI r2, 51
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
