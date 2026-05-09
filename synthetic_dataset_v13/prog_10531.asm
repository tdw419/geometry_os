; DESCRIPTION: Renders a cyan box of size 94x117 starting at (232, 114).
; PLAN: r0=232(x), r1=114(y), r2=94(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 114
LDI r2, 94
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
