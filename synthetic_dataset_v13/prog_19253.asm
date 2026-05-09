; DESCRIPTION: Renders a magenta box of size 95x92 starting at (242, 53).
; PLAN: r0=242(x), r1=53(y), r2=95(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 53
LDI r2, 95
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
