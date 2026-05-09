; DESCRIPTION: Renders a cyan box of size 22x11 starting at (330, 98).
; PLAN: r0=330(x), r1=98(y), r2=22(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 98
LDI r2, 22
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
