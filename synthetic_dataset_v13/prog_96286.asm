; DESCRIPTION: Renders a cyan box of size 109x45 starting at (231, 59).
; PLAN: r0=231(x), r1=59(y), r2=109(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 59
LDI r2, 109
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
