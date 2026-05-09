; DESCRIPTION: Places a yellow 20x91 rectangle at position (81, 71).
; PLAN: r0=81(x), r1=71(y), r2=20(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 71
LDI r2, 20
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
