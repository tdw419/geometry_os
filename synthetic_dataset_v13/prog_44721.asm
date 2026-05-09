; DESCRIPTION: Renders a purple box of size 51x18 starting at (344, 146).
; PLAN: r0=344(x), r1=146(y), r2=51(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 146
LDI r2, 51
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
