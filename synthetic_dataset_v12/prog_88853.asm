; DESCRIPTION: Places a yellow 14x45 rectangle at position (475, 209).
; PLAN: r0=475(x), r1=209(y), r2=14(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 209
LDI r2, 14
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
