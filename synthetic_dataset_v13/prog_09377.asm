; DESCRIPTION: Composite: Places a magenta dot at position (162, 136) then Places a cyan 12x34 rectangle at position (422, 135).
; PLAN: r0=162(x), r1=136(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=135(y), r7=12(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 136
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 135
LDI r7, 12
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
