; DESCRIPTION: Composite: Places a green 59x71 rectangle at position (291, 72) then Places a cyan dot at position (299, 190) then Renders a green disk with center (111, 128) and radius 68.
; PLAN: r0=291(x), r1=72(y), r2=59(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=128(y), r12=68(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 72
LDI r2, 59
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 128
LDI r12, 68
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
