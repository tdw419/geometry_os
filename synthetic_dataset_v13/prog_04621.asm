; DESCRIPTION: Renders a purple box of size 38x74 starting at (248, 164).
; PLAN: r0=248(x), r1=164(y), r2=38(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 164
LDI r2, 38
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
