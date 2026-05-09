; DESCRIPTION: Renders a green box of size 103x94 starting at (193, 65).
; PLAN: r0=193(x), r1=65(y), r2=103(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 65
LDI r2, 103
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
