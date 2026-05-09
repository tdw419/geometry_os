; DESCRIPTION: Renders a cyan box of size 83x59 starting at (162, 72).
; PLAN: r0=162(x), r1=72(y), r2=83(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 72
LDI r2, 83
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
