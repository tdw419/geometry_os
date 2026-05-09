; DESCRIPTION: Renders a cyan box of size 86x21 starting at (200, 110).
; PLAN: r0=200(x), r1=110(y), r2=86(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 110
LDI r2, 86
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
