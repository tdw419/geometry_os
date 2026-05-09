; DESCRIPTION: Renders a cyan box of size 68x37 starting at (420, 54).
; PLAN: r0=420(x), r1=54(y), r2=68(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 54
LDI r2, 68
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
