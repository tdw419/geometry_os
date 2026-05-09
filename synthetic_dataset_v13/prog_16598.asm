; DESCRIPTION: Renders a cyan box of size 40x20 starting at (163, 47).
; PLAN: r0=163(x), r1=47(y), r2=40(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 47
LDI r2, 40
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
