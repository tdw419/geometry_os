; DESCRIPTION: Places a yellow 111x37 rectangle at position (264, 197).
; PLAN: r0=264(x), r1=197(y), r2=111(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 197
LDI r2, 111
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
