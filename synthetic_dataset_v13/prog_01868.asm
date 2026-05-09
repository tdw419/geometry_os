; DESCRIPTION: Renders a cyan box of size 80x55 starting at (7, 167).
; PLAN: r0=7(x), r1=167(y), r2=80(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 167
LDI r2, 80
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
