; DESCRIPTION: Renders a cyan box of size 66x111 starting at (75, 51).
; PLAN: r0=75(x), r1=51(y), r2=66(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 51
LDI r2, 66
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
