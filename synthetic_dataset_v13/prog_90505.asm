; DESCRIPTION: Renders a cyan box of size 65x99 starting at (391, 108).
; PLAN: r0=391(x), r1=108(y), r2=65(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 108
LDI r2, 65
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
