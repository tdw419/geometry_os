; DESCRIPTION: Renders a cyan box of size 36x74 starting at (373, 112).
; PLAN: r0=373(x), r1=112(y), r2=36(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 112
LDI r2, 36
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
