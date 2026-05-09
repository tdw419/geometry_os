; DESCRIPTION: Composite: Renders a blue box of size 89x48 starting at (71, 204) then Places a cyan dot at position (433, 47).
; PLAN: r0=71(x), r1=204(y), r2=89(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=47(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 204
LDI r2, 89
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 47
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
