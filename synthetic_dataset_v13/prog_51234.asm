; DESCRIPTION: Renders a magenta box of size 95x27 starting at (242, 37).
; PLAN: r0=242(x), r1=37(y), r2=95(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 37
LDI r2, 95
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
