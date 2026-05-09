; DESCRIPTION: Renders a green box of size 27x94 starting at (75, 34).
; PLAN: r0=75(x), r1=34(y), r2=27(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 34
LDI r2, 27
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
