; DESCRIPTION: Renders a cyan box of size 117x38 starting at (99, 76).
; PLAN: r0=99(x), r1=76(y), r2=117(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 76
LDI r2, 117
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
