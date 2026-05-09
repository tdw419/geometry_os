; DESCRIPTION: Renders a purple box of size 70x45 starting at (242, 38).
; PLAN: r0=242(x), r1=38(y), r2=70(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 38
LDI r2, 70
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
