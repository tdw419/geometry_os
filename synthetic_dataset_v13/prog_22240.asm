; DESCRIPTION: Renders a cyan box of size 29x30 starting at (420, 185).
; PLAN: r0=420(x), r1=185(y), r2=29(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 185
LDI r2, 29
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
