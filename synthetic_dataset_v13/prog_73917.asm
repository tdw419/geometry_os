; DESCRIPTION: Renders a yellow box of size 70x94 starting at (417, 107).
; PLAN: r0=417(x), r1=107(y), r2=70(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 107
LDI r2, 70
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
