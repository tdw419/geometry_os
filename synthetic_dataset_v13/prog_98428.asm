; DESCRIPTION: Composite: Renders a cyan box of size 41x39 starting at (50, 166) then Creates a magenta circular shape at (374, 179) with radius 18.
; PLAN: r0=50(x), r1=166(y), r2=41(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=179(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 166
LDI r2, 41
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 179
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
