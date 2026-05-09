; DESCRIPTION: Renders a cyan box of size 105x18 starting at (317, 5).
; PLAN: r0=317(x), r1=5(y), r2=105(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 5
LDI r2, 105
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
