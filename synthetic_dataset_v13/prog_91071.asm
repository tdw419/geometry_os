; DESCRIPTION: Renders a cyan box of size 117x99 starting at (285, 108).
; PLAN: r0=285(x), r1=108(y), r2=117(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 108
LDI r2, 117
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
