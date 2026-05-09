; DESCRIPTION: Renders a cyan box of size 70x65 starting at (423, 52).
; PLAN: r0=423(x), r1=52(y), r2=70(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 52
LDI r2, 70
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
