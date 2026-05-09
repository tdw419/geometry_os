; DESCRIPTION: Places a yellow 111x48 rectangle at position (119, 166).
; PLAN: r0=119(x), r1=166(y), r2=111(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 166
LDI r2, 111
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
