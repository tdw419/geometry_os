; DESCRIPTION: Renders a purple box of size 111x73 starting at (242, 132).
; PLAN: r0=242(x), r1=132(y), r2=111(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 132
LDI r2, 111
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
