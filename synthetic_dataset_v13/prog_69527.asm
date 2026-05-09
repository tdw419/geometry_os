; DESCRIPTION: Renders a purple box of size 45x64 starting at (127, 146).
; PLAN: r0=127(x), r1=146(y), r2=45(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 146
LDI r2, 45
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
