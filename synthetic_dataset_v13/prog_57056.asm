; DESCRIPTION: Renders a cyan box of size 51x47 starting at (228, 25).
; PLAN: r0=228(x), r1=25(y), r2=51(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 25
LDI r2, 51
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
