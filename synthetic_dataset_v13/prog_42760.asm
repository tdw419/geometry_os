; DESCRIPTION: Renders a cyan box of size 37x93 starting at (292, 160).
; PLAN: r0=292(x), r1=160(y), r2=37(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 160
LDI r2, 37
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
