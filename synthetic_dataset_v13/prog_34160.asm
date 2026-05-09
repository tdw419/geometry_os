; DESCRIPTION: Renders a cyan box of size 41x83 starting at (455, 13).
; PLAN: r0=455(x), r1=13(y), r2=41(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 13
LDI r2, 41
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
