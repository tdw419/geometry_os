; DESCRIPTION: Renders a cyan box of size 33x108 starting at (370, 25).
; PLAN: r0=370(x), r1=25(y), r2=33(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 25
LDI r2, 33
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
