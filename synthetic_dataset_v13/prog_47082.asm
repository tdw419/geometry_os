; DESCRIPTION: Renders a cyan box of size 36x46 starting at (39, 74).
; PLAN: r0=39(x), r1=74(y), r2=36(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 74
LDI r2, 36
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
