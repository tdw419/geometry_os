; DESCRIPTION: Renders a cyan box of size 93x45 starting at (310, 127).
; PLAN: r0=310(x), r1=127(y), r2=93(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 127
LDI r2, 93
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
