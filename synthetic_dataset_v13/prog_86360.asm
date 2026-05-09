; DESCRIPTION: Renders a magenta box of size 40x104 starting at (403, 82).
; PLAN: r0=403(x), r1=82(y), r2=40(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 82
LDI r2, 40
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
