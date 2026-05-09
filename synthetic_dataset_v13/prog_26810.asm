; DESCRIPTION: Renders a cyan box of size 35x93 starting at (30, 91).
; PLAN: r0=30(x), r1=91(y), r2=35(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 91
LDI r2, 35
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
