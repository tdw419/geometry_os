; DESCRIPTION: Renders a cyan box of size 61x110 starting at (207, 97).
; PLAN: r0=207(x), r1=97(y), r2=61(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 97
LDI r2, 61
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
