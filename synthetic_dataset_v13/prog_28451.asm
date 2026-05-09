; DESCRIPTION: Renders a purple box of size 56x48 starting at (70, 177).
; PLAN: r0=70(x), r1=177(y), r2=56(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 177
LDI r2, 56
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
