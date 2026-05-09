; DESCRIPTION: Renders a cyan box of size 117x59 starting at (33, 23).
; PLAN: r0=33(x), r1=23(y), r2=117(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 23
LDI r2, 117
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
