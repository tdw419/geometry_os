; DESCRIPTION: Composite: Places a cyan 61x59 rectangle at position (170, 184) then Places a blue dot at position (195, 155).
; PLAN: r0=170(x), r1=184(y), r2=61(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=155(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 170
LDI r1, 184
LDI r2, 61
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 155
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
