; DESCRIPTION: Renders a magenta box of size 34x32 starting at (181, 146).
; PLAN: r0=181(x), r1=146(y), r2=34(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 146
LDI r2, 34
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
