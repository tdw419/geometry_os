; DESCRIPTION: Renders a cyan box of size 11x10 starting at (249, 127).
; PLAN: r0=249(x), r1=127(y), r2=11(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 127
LDI r2, 11
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
