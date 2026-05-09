; DESCRIPTION: Creates a magenta rectangular region at (404, 112) spanning 78 by 98 pixels.
; PLAN: r0=404(x), r1=112(y), r2=78(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 112
LDI r2, 78
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
