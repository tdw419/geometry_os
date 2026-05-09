; DESCRIPTION: Composite: Places a cyan 120x71 rectangle at position (119, 48) then Places a yellow dot at position (278, 204).
; PLAN: r0=119(x), r1=48(y), r2=120(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=204(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 48
LDI r2, 120
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 204
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
