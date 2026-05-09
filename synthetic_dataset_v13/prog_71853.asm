; DESCRIPTION: Renders a cyan box of size 57x119 starting at (200, 35).
; PLAN: r0=200(x), r1=35(y), r2=57(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 35
LDI r2, 57
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
