; DESCRIPTION: Renders a cyan box of size 20x44 starting at (300, 118).
; PLAN: r0=300(x), r1=118(y), r2=20(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 118
LDI r2, 20
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
