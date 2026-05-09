; DESCRIPTION: Renders a purple box of size 117x115 starting at (213, 117).
; PLAN: r0=213(x), r1=117(y), r2=117(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 117
LDI r2, 117
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
