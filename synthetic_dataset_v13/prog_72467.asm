; DESCRIPTION: Renders a magenta box of size 65x111 starting at (186, 38).
; PLAN: r0=186(x), r1=38(y), r2=65(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 38
LDI r2, 65
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
