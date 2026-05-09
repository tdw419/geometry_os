; DESCRIPTION: Renders a cyan box of size 65x104 starting at (94, 6).
; PLAN: r0=94(x), r1=6(y), r2=65(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 6
LDI r2, 65
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
