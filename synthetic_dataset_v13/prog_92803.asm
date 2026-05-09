; DESCRIPTION: Renders a cyan box of size 47x113 starting at (339, 35).
; PLAN: r0=339(x), r1=35(y), r2=47(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 35
LDI r2, 47
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
