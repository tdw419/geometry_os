; DESCRIPTION: Renders a cyan box of size 39x61 starting at (462, 17).
; PLAN: r0=462(x), r1=17(y), r2=39(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 17
LDI r2, 39
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
