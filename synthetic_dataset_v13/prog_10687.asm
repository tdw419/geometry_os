; DESCRIPTION: Renders a cyan box of size 53x80 starting at (7, 85).
; PLAN: r0=7(x), r1=85(y), r2=53(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 85
LDI r2, 53
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
