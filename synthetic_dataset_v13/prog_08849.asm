; DESCRIPTION: Renders a cyan box of size 45x108 starting at (374, 86).
; PLAN: r0=374(x), r1=86(y), r2=45(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 86
LDI r2, 45
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
