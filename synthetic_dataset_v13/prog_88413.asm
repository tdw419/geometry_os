; DESCRIPTION: Renders a cyan box of size 119x75 starting at (326, 148).
; PLAN: r0=326(x), r1=148(y), r2=119(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 148
LDI r2, 119
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
