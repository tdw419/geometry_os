; DESCRIPTION: Renders a magenta box of size 65x50 starting at (445, 48).
; PLAN: r0=445(x), r1=48(y), r2=65(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 48
LDI r2, 65
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
