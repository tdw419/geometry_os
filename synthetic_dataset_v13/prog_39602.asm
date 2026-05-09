; DESCRIPTION: Composite: Places a blue dot at position (188, 149) then Places a yellow 55x48 rectangle at position (367, 197).
; PLAN: r0=188(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=197(y), r7=55(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 197
LDI r7, 55
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
