; DESCRIPTION: Renders a cyan box of size 38x70 starting at (30, 185).
; PLAN: r0=30(x), r1=185(y), r2=38(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 185
LDI r2, 38
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
