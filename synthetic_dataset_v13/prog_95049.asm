; DESCRIPTION: Renders a cyan box of size 94x85 starting at (132, 75).
; PLAN: r0=132(x), r1=75(y), r2=94(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 75
LDI r2, 94
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
