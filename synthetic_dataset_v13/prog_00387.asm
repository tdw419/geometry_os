; DESCRIPTION: Renders a magenta box of size 48x103 starting at (403, 99).
; PLAN: r0=403(x), r1=99(y), r2=48(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 99
LDI r2, 48
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
