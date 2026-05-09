; DESCRIPTION: Renders a cyan box of size 89x39 starting at (416, 20).
; PLAN: r0=416(x), r1=20(y), r2=89(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 20
LDI r2, 89
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
