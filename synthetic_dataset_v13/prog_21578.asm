; DESCRIPTION: Renders a green box of size 72x57 starting at (20, 107).
; PLAN: r0=20(x), r1=107(y), r2=72(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 107
LDI r2, 72
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
