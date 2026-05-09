; DESCRIPTION: Places a green 111x91 rectangle at position (6, 19).
; PLAN: r0=6(x), r1=19(y), r2=111(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 19
LDI r2, 111
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
