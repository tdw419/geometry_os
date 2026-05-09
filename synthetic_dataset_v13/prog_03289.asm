; DESCRIPTION: Renders a cyan box of size 100x117 starting at (399, 124).
; PLAN: r0=399(x), r1=124(y), r2=100(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 124
LDI r2, 100
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
