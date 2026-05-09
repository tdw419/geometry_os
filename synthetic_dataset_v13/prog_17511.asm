; DESCRIPTION: Renders a cyan box of size 22x36 starting at (317, 21).
; PLAN: r0=317(x), r1=21(y), r2=22(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 21
LDI r2, 22
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
