; DESCRIPTION: Renders a cyan box of size 59x94 starting at (146, 110).
; PLAN: r0=146(x), r1=110(y), r2=59(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 110
LDI r2, 59
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
