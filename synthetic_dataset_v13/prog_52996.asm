; DESCRIPTION: Places a green 49x23 rectangle at position (391, 209).
; PLAN: r0=391(x), r1=209(y), r2=49(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 209
LDI r2, 49
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
