; DESCRIPTION: Renders a cyan box of size 110x25 starting at (230, 20).
; PLAN: r0=230(x), r1=20(y), r2=110(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 20
LDI r2, 110
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
