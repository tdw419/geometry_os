; DESCRIPTION: Renders a magenta box of size 36x29 starting at (328, 215).
; PLAN: r0=328(x), r1=215(y), r2=36(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 215
LDI r2, 36
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
