; DESCRIPTION: Renders a magenta box of size 67x120 starting at (403, 57).
; PLAN: r0=403(x), r1=57(y), r2=67(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 57
LDI r2, 67
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
