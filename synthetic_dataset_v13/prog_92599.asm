; DESCRIPTION: Composite: Places a blue 13x12 rectangle at position (422, 242) then Places a cyan dot at position (136, 225).
; PLAN: r0=422(x), r1=242(y), r2=13(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=225(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 242
LDI r2, 13
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 225
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
