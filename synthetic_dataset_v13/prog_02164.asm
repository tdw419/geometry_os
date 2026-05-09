; DESCRIPTION: Renders a cyan box of size 51x54 starting at (444, 70).
; PLAN: r0=444(x), r1=70(y), r2=51(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 70
LDI r2, 51
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
