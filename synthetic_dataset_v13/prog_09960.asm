; DESCRIPTION: Renders a cyan box of size 22x95 starting at (442, 145).
; PLAN: r0=442(x), r1=145(y), r2=22(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 145
LDI r2, 22
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
