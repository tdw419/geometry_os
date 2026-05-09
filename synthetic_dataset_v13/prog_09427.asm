; DESCRIPTION: Composite: Renders a green box of size 47x72 starting at (373, 41) then Places a cyan dot at position (291, 195) then Places a magenta circle of radius 65 at center (434, 114).
; PLAN: r0=373(x), r1=41(y), r2=47(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=195(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=434(x), r11=114(y), r12=65(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 41
LDI r2, 47
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 195
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 434
LDI r11, 114
LDI r12, 65
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
