; DESCRIPTION: Renders a cyan box of size 109x45 starting at (96, 188).
; PLAN: r0=96(x), r1=188(y), r2=109(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 188
LDI r2, 109
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
