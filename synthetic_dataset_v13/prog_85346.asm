; DESCRIPTION: Renders a cyan box of size 13x46 starting at (200, 61).
; PLAN: r0=200(x), r1=61(y), r2=13(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 61
LDI r2, 13
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
