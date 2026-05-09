; DESCRIPTION: Renders a cyan box of size 75x14 starting at (100, 220).
; PLAN: r0=100(x), r1=220(y), r2=75(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 220
LDI r2, 75
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
