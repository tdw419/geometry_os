; DESCRIPTION: Renders a cyan box of size 24x109 starting at (430, 51).
; PLAN: r0=430(x), r1=51(y), r2=24(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 51
LDI r2, 24
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
