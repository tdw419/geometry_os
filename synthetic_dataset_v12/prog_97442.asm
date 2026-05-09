; DESCRIPTION: Renders a purple box of size 113x73 starting at (294, 159).
; PLAN: r0=294(x), r1=159(y), r2=113(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 159
LDI r2, 113
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
