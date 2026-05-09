; DESCRIPTION: Renders a magenta box of size 76x48 starting at (187, 142).
; PLAN: r0=187(x), r1=142(y), r2=76(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 142
LDI r2, 76
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
