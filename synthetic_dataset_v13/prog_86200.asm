; DESCRIPTION: Renders a magenta box of size 59x48 starting at (154, 164).
; PLAN: r0=154(x), r1=164(y), r2=59(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 164
LDI r2, 59
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
