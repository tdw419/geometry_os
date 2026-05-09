; DESCRIPTION: Renders a cyan box of size 79x59 starting at (98, 122).
; PLAN: r0=98(x), r1=122(y), r2=79(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 122
LDI r2, 79
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
