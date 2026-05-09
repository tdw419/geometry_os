; DESCRIPTION: Renders a cyan box of size 69x22 starting at (395, 79).
; PLAN: r0=395(x), r1=79(y), r2=69(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 79
LDI r2, 69
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
