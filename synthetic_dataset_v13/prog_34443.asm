; DESCRIPTION: Creates a magenta rectangular region at (146, 130) spanning 17 by 71 pixels.
; PLAN: r0=146(x), r1=130(y), r2=17(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 130
LDI r2, 17
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
