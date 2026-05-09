; DESCRIPTION: Renders a cyan box of size 33x75 starting at (396, 34).
; PLAN: r0=396(x), r1=34(y), r2=33(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 34
LDI r2, 33
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
