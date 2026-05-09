; DESCRIPTION: Renders a cyan box of size 51x112 starting at (96, 27).
; PLAN: r0=96(x), r1=27(y), r2=51(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 27
LDI r2, 51
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
