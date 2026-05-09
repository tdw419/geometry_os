; DESCRIPTION: Creates a magenta rectangular region at (279, 48) spanning 111 by 82 pixels.
; PLAN: r0=279(x), r1=48(y), r2=111(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 48
LDI r2, 111
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
