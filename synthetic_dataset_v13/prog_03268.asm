; DESCRIPTION: Composite: Places a magenta circle of radius 41 at center (374, 95) then Places a cyan 91x63 rectangle at position (170, 125).
; PLAN: r0=374(x), r1=95(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=125(y), r7=91(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 95
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 125
LDI r7, 91
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
