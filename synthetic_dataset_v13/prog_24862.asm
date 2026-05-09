; DESCRIPTION: Renders a purple box of size 74x21 starting at (197, 164).
; PLAN: r0=197(x), r1=164(y), r2=74(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 164
LDI r2, 74
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
