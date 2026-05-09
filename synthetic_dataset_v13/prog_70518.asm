; DESCRIPTION: Renders a cyan box of size 74x79 starting at (38, 80).
; PLAN: r0=38(x), r1=80(y), r2=74(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 80
LDI r2, 74
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
